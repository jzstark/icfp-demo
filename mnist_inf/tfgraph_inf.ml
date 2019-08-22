#!/usr/bin/env owl

#require "owl-tensorflow"

(* 1. Open modules *)
open Owl
open Owl_tensorflow
open Owl_converter
module G = Owl_computation_cpu_engine.Make (Dense.Ndarray.S)
module T = Owl_converter.Make (G)
module CGCompiler = Owl_neural_compiler.Make (G)
open CGCompiler.Neural
open CGCompiler.Neural.Graph
open CGCompiler.Neural.Algodiff

(* 2. Construct neural network *)
let make_network input_shape =
  input input_shape
  |> lambda (fun x -> Maths.(x / pack_flt 256.))
  |> conv2d [|5;5;1;32|] [|1;1|] ~act_typ:Activation.Relu
  |> max_pool2d [|2;2|] [|2;2|]
  |> fully_connected 1024 ~act_typ:Activation.Relu 
  |> linear 10 ~act_typ:Activation.(Softmax 1)
  |> get_network ~name:"mnist"

let network = make_network [|28;28;1|]
let _ = Graph.init network

(* 3. Lazy Execution *)
let x = G.var_arr "x" ~shape:[|100;28;28;1|] |> pack_arr 
let y = Graph.forward network x |> fst 

(* 4. Construct computation graph *)
let output = [| unpack_arr y |> G.arr_to_node |]
let input  = [| unpack_arr x |> G.arr_to_node |]
let cgraph = G.make_graph ~input ~output "graph_diff"

(* 5. Convert to TensorFlow Graph *)
let pbtxt = T.(convert cgraph |> to_pbtxt)
let _ = Owl_io.write_file "tf_convert_mnist.pbtxt" pbtxt
