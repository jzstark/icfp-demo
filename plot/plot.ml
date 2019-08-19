#!/usr/bin/env owl

open Owl
module G = Owl_computation_cpu_engine.Make (Arr)
module A = Owl_algodiff_generic.Make (G)
include Owl_neural_generic.Make (G)
open Graph


let make_mnist_network input_shape =
  input input_shape
  |> normalisation ~decay:0.9
  |> conv2d [|5;5;3;32|] [|1;1|] ~act_typ:Activation.Relu
  |> max_pool2d [|2;2|] [|2;2|]
  |> fully_connected 1024 ~act_typ:Activation.Relu
  |> linear 10 ~act_typ:Activation.(Softmax 1)
  |> get_network ~name:"mnist"


let visualise_mnist () =

  (* Construct computation *)
  let network = make_mnist_network [|32;32;3|] in
  let xt = G.var_arr "xt" ~shape:[|100;32;32;3|] |> A.pack_arr in
  let yt = G.var_arr "yt" ~shape:[|100;10|] |> A.pack_arr in
  let yt', _ = Graph.(init network; forward network xt) in
  let loss = A.(Maths.((cross_entropy yt yt') / (pack_flt (Mat.row_num yt |> float_of_int)))) in
  let _, adj0 = Graph.(backward network loss) in

  (* Forward graph *)
  let inputs = [| xt |> A.unpack_arr |> G.arr_to_node |] in
  let s0_outputs = [| loss |> A.unpack_elt |> G.elt_to_node |] in
  let s0 = G.make_graph inputs s0_outputs "mnist_loss" |> G.graph_to_dot in
  (* Backward graph *)
  let s1_outputs = adj0
    |> Utils.Array.flatten
    |> Array.map (fun a -> A.unpack_arr a |> G.arr_to_node)
  in
  let s1 = G.make_graph inputs s1_outputs "mnist_loss" |> G.graph_to_dot in

  Owl_io.write_file "mnist_loss.dot" s0;
  Owl_io.write_file "mnist_grad.dot" s1;
  Sys.command "dot -Tpdf mnist_loss.dot -o mnist_loss.pdf" |> ignore;
  Sys.command "dot -Tpdf mnist_grad.dot -o mnist_grad.pdf" |> ignore

let _ = visualise_mnist ()
