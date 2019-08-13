#!/usr/bin/env owl

open Owl

module G = Owl_computation_cpu_engine.Make (Dense.Ndarray.S)
module CGCompiler = Owl_neural_compiler.Make (G)
open CGCompiler.Neural
open CGCompiler.Neural.Graph
open CGCompiler.Neural.Algodiff


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

let x = G.var_arr "x" ~shape:[|100;28;28;1|] |> pack_arr 
let y = G.var_arr "y" ~shape:[|100;10|] |> pack_arr 
let y' = Graph.forward network x |> fst 
let loss = Maths.cross_entropy y y' 
let z = Graph.backward network loss |> fst

let input = [| unpack_arr y |> G.arr_to_node |]
let output = Array.map (fun a -> unpack_arr a |> G.arr_to_node) z.(5)
let cgraph = G.make_graph ~input ~output "graph_diff"

(*
let x = G.var_arr "x" ~shape:[|100;28;28;1|] |> pack_arr 
let y = Graph.forward network x |> fst 
let output = [| unpack_arr y |> G.arr_to_node |]
let input  = [| unpack_arr x |> G.arr_to_node |]
let cgraph = G.make_graph ~input ~output "graph_diff"
*)

let s = G.graph_to_dot cgraph
let _ = Owl_io.write_file "backward.dot" s
let _ = Sys.command "dot -Tpng backward.dot -o backward.png" |> ignore
