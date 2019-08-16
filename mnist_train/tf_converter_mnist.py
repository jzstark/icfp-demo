#!/usr/bin/env python

import numpy as np
import os
import tensorflow as tf
from google.protobuf import text_format
from tensorflow.python.framework import graph_io

#os.environ['KMP_DUPLICATE_LIB_OK']='True'

from tensorflow.examples.tutorials.mnist import input_data
mnist = input_data.read_data_sets("MNIST_data/", one_hot=True)
# NOTE: The batch_size has to be 100 as specified by OCaml
batch_size = 100

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
    config = tf.ConfigProto()
    config.gpu_options.allow_growth = True

    sess = tf.Session(config=config)
    saver = tf.train.import_meta_graph(filename+'.pb')
    graph = tf.get_default_graph()

    x = graph.get_tensor_by_name('x:0')
    y = tf.placeholder("float", [None, 10])
    result = tf.get_collection("result")[0]

    cross_entropy = tf.reduce_mean(
        tf.nn.softmax_cross_entropy_with_logits_v2(
        labels=y, logits=result
    ))
    #summary_writer = tf.summary.FileWriter(".", sess.graph)
    train_step = tf.train.AdamOptimizer(1e-4).minimize(cross_entropy)

    correct_pred = tf.equal(tf.argmax(result, 1), tf.argmax(y, 1))
    accuracy = tf.reduce_mean(tf.cast(correct_pred, tf.float32))

    init = tf.global_variables_initializer()
    sess.run(init)

    for i in range(2000):
        batch_x, batch_y = mnist.train.next_batch(batch_size)
        batch_x = np.reshape(batch_x, (-1,28,28,1))
        sess.run(train_step, feed_dict={x: batch_x, y: batch_y})
    
        if (i % 100 == 0):
            minibatch_loss, acc = sess.run([cross_entropy, accuracy], feed_dict={x: batch_x, y: batch_y})
            print("Loss:%s\n" % str(minibatch_loss))
            print("Accuracy:%s\n" % str(acc))
