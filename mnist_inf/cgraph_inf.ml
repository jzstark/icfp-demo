#!/usr/bin/env owl

(* 1. Open modules *)
open Owl
module G = Owl_computation_cpu_engine.Make (Dense.Ndarray.S)
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

(* 3. Lazy execution *)
let x = G.var_arr "x" ~shape:[|100;28;28;1|] 
let y = Graph.forward network (pack_arr x) |> fst |> unpack_arr

(* 4. Evaluation with real value*)
let real_value = Dense.Ndarray.S.uniform [|100;28;28;1|]
let _ = G.assign_arr x real_value 
let _ = G.eval_arr [|y|]
let result = G.unpack_arr y
let _ = Dense.Ndarray.S.print result
