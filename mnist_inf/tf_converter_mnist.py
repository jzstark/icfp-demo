#!/usr/bin/env python

import numpy as np
import os
import tensorflow as tf
from google.protobuf import text_format
from tensorflow.python.framework import graph_io

filename = 'tf_convert_mnist'
with open(filename + '.pbtxt', 'r') as f:
  	metagraph_def = tf.MetaGraphDef()
  	file_content = f.read()
  	text_format.Merge(file_content,metagraph_def)
  	graph_io.write_graph(metagraph_def, 
  		os.path.dirname(filename),
    	os.path.basename(filename) + '.pb',
    	as_text=False)

input_data = np.random.rand(100, 28, 28, 1)

with tf.Graph().as_default():
    sess = tf.Session()
    saver = tf.train.import_meta_graph(filename+'.pb')
    graph = tf.get_default_graph()

    init = tf.global_variables_initializer()
    sess.run(init)

    x = graph.get_tensor_by_name('x:0')
    y = tf.placeholder("float", [None, 10])
    result = tf.get_collection("result")[0]

    z = sess.run(result, feed_dict={x:input_data})
    print(z)
