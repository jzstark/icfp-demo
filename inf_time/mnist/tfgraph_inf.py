#!/usr/bin/env python

import numpy as np
import os
import tensorflow as tf
from google.protobuf import text_format
from tensorflow.python.framework import graph_io

os.environ['KMP_DUPLICATE_LIB_OK']='True'

# Convert pbtxt graph to pb format 
filename = 'tf_convert_mnist'
with open(filename + '.pbtxt', 'r') as f:
  	metagraph_def = tf.compat.v1.MetaGraphDef()
  	file_content = f.read()
  	text_format.Merge(file_content,metagraph_def)
  	graph_io.write_graph(metagraph_def, 
  		os.path.dirname(filename),
    	os.path.basename(filename) + '.pb',
   	as_text=False)

# Prepare inference input data
input_data = np.random.rand(100, 28, 28, 1)

with tf.Graph().as_default():
    # Session configuration 
    config = tf.compat.v1.ConfigProto()
    config.gpu_options.allow_growth = True

    # Start session and import graph from pb file
    sess = tf.compat.v1.Session(config=config)
    saver = tf.compat.v1.train.import_meta_graph(filename+'.pb')
    graph = tf.compat.v1.get_default_graph()
    
    init = tf.global_variables_initializer()
    sess.run(init)

    x = graph.get_tensor_by_name('x:0')
    y = tf.compat.v1.placeholder("float", [None, 10])
    result = tf.compat.v1.get_collection("result")[0]

    z = sess.run(result, feed_dict={x:input_data})
    print(z)
