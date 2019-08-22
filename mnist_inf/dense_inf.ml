#!/usr/bin/env owl

(* 1. Open modules *)
open Owl
module N = Dense.Ndarray.S
open Neural.S
open Neural.S.Graph
open Neural.S.Algodiff

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

(* 3. Evaluation *)
let x = Dense.Ndarray.S.uniform [|100;28;28;1|]
let y = Graph.forward network (Algodiff.pack_arr x) |> fst |> Algodiff.unpack_arr
let _ = Dense.Ndarray.S.print y

