#!/usr/bin/env python

import numpy as np
import os
import tensorflow as tf
from google.protobuf import text_format
from tensorflow.python.framework import graph_io

from tensorflow.examples.tutorials.mnist import input_data
mnist = input_data.read_data_sets("../data/", one_hot=True)

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
batch_x, batch_y = mnist.train.next_batch(100)
batch_x = np.reshape(batch_x, (-1,28,28,1))

with tf.Graph().as_default():
    # Session configuration 
    config = tf.compat.v1.ConfigProto()
    config.gpu_options.allow_growth = True
    sess = tf.compat.v1.Session(config=config)

    # Import graph from pb file
    saver = tf.compat.v1.train.import_meta_graph(filename+'.pb')
    graph = tf.compat.v1.get_default_graph()
    
    # Load pre-trained variables
    saver.restore(sess, "owl_model.ckpt")

    # Get input and output from computation grpah 
    x = graph.get_tensor_by_name('x:0')
    result = tf.compat.v1.get_collection("result")[0]

    # Create extra placeholder and tensors
    y = tf.compat.v1.placeholder("float", [None, 10])
    y_data = tf.compat.v1.placeholder("float", [None, 10])
    pred = tf.equal(tf.argmax(result, 1), tf.argmax(y_data, 1))
    accu = tf.reduce_mean(tf.cast(pred, tf.float32))

    # Execute
    predict, accuracy = sess.run([pred, accu], feed_dict={x:batch_x, y_data:batch_y})
    print("\n\nPrediction:\n", predict)
    print("\nTest accuracy is: %.2f%%" % (accuracy * 100))
