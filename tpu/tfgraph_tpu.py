#!/usr/bin/env python

""" 
Flags:
export TF_XLA_FLAGS="--tf_xla_cpu_global_jit"
export XLA_FLAGS="--xla_dump_hlo_as_text --xla_dump_to=/tmp"
"""

import numpy as np
import os
import tensorflow as tf
from google.protobuf import text_format
from tensorflow.python.framework import graph_io

#tf.config.optimizer_set_jit(True)

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

input_data = np.random.rand(100, 28, 28, 1)


with tf.device('/device:XLA_GPU:0'):
    with tf.Graph().as_default():
        # Session configuration 
        config = tf.compat.v1.ConfigProto()
        config.graph_options.optimizer_options.global_jit_level = tf.OptimizerOptions.ON_1
        config.gpu_options.allow_growth = True

        # Start session and import graph from pb file
        sess = tf.compat.v1.Session(config=config)
        saver = tf.compat.v1.train.import_meta_graph(filename+'.pb')
        graph = tf.compat.v1.get_default_graph()

        init = tf.compat.v1.global_variables_initializer()
        sess.run(init)

        x = graph.get_tensor_by_name('x:0')
        y = tf.compat.v1.placeholder("float", [None, 10])
        result = tf.compat.v1.get_collection("result")[0]

        z = sess.run(result, feed_dict={x:input_data})
        print(z)

        """
        image = tf.placeholder(np.float32, shape=[128, 128, 128, 2])
        filter = tf.placeholder(np.float32, shape=[2, 2, 2, 2])
        bias = tf.placeholder(np.float32, shape=[128, 128, 128, 2])
        convolution = tf.nn.conv2d(image, filter, [1, 1, 1, 1], padding="SAME", data_format='NHWC')
        result = tf.nn.relu(convolution + bias)

        img_input = np.ones((128, 128, 128, 2), np.float32)
        filter_input = np.ones((2, 2, 2, 2), np.float32)
        bias_input = np.ones((128, 128, 128, 2), np.float32)
        print(sess.run(result, feed_dict={image: img_input, filter: filter_input, bias: bias_input}))
        """