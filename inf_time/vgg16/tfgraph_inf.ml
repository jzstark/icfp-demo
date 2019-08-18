#!/usr/bin/env owl

#require "owl-tensorflow"

open Owl
open Owl_tensorflow
open Owl_converter

module G = Owl_computation_cpu_engine.Make (Dense.Ndarray.S)
module T = Owl_converter.Make (G)

module CGCompiler = Owl_neural_compiler.Make (G)
open CGCompiler.Neural
open CGCompiler.Neural.Graph
open CGCompiler.Neural.Algodiff

(*
let make_network input_shape =
  input input_shape
  |> lambda (fun x -> Maths.(x / pack_flt 256.))
  |> conv2d [|5;5;1;32|] [|1;1|] ~act_typ:Activation.Relu
  |> max_pool2d [|2;2|] [|2;2|]
  |> fully_connected 1024 ~act_typ:Activation.Relu 
  |> linear 10 ~act_typ:Activation.(Softmax 1)
  |> get_network ~name:"mnist"
*)
let make_network img_size =
  input [|img_size;img_size;3|]
  (* block 1 *)
  |> conv2d [|3;3;3;64|] [|1;1|] ~act_typ:Activation.Relu ~padding:SAME
  |> conv2d [|3;3;64;64|] [|1;1|] ~act_typ:Activation.Relu ~padding:SAME
  |> max_pool2d [|2;2|] [|2;2|] ~padding:VALID
  (* block 2 *)
  |> conv2d [|3;3;64;128|] [|1;1|] ~act_typ:Activation.Relu ~padding:SAME
  |> conv2d [|3;3;128;128|] [|1;1|] ~act_typ:Activation.Relu ~padding:SAME
  |> max_pool2d [|2;2|] [|2;2|] ~padding:VALID
  (* block 3 *)
  |> conv2d [|3;3;128;256|] [|1;1|] ~act_typ:Activation.Relu ~padding:SAME
  |> conv2d [|3;3;256;256|] [|1;1|] ~act_typ:Activation.Relu ~padding:SAME
  |> conv2d [|3;3;256;256|] [|1;1|] ~act_typ:Activation.Relu ~padding:SAME
  |> max_pool2d [|2;2|] [|2;2|] ~padding:VALID
  (* block 4 *)
  |> conv2d [|3;3;256;512|] [|1;1|] ~act_typ:Activation.Relu ~padding:SAME
  |> conv2d [|3;3;512;512|] [|1;1|] ~act_typ:Activation.Relu ~padding:SAME
  |> conv2d [|3;3;512;512|] [|1;1|] ~act_typ:Activation.Relu ~padding:SAME
  |> max_pool2d [|2;2|] [|2;2|] ~padding:VALID
  (* block 5 *)
  |> conv2d [|3;3;512;512|] [|1;1|] ~act_typ:Activation.Relu ~padding:SAME
  |> conv2d [|3;3;512;512|] [|1;1|] ~act_typ:Activation.Relu ~padding:SAME
  |> conv2d [|3;3;512;512|] [|1;1|] ~act_typ:Activation.Relu ~padding:SAME
  |> max_pool2d [|2;2|] [|2;2|] ~padding:VALID
  (* classification block *)
  |> flatten
  |> fully_connected ~act_typ:Activation.Relu 4096
  |> fully_connected ~act_typ:Activation.Relu 4096
  |> fully_connected ~act_typ:Activation.(Softmax 1) 1000
  |> get_network


let network = make_network 250
let _ = Graph.init network

let x = G.var_arr "x" ~shape:[|1;250;250;3|] |> pack_arr 
let y = Graph.forward network x |> fst 

let output = [| unpack_arr y |> G.arr_to_node |]
let input  = [| unpack_arr x |> G.arr_to_node |]
let cgraph = G.make_graph ~input ~output "graph_diff"

let s = G.graph_to_dot cgraph
(* let _ = Owl_io.write_file "mnist.dot" s *)

let pbtxt = T.(convert cgraph |> to_pbtxt)
let _ = Owl_io.write_file "tf_convert_mnist.pbtxt" pbtxt

