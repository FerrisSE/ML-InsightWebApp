package weka.api;

import java.io.BufferedReader;
//imports
import java.io.File;
import java.io.FileReader;

import weka.core.Instances;
import weka.core.converters.ArffSaver;
import weka.filters.Filter;
import weka.filters.unsupervised.instance.NonSparseToSparse;

public class Sparse {
	public static void main(String args[]) throws Exception{
		//load dataset

		String filePath = "./SparseFiles/sparse.arff";
		Instances dataset = new Instances(new BufferedReader(new FileReader(filePath))); // <<--alternate means of retrieval-->> to be tested later
	
		//create NonSparseToSparse object to save in sparse ARFF format
		NonSparseToSparse sp = new NonSparseToSparse();
		
		//specify the dataset
		sp.setInputFormat(dataset);
		//apply
		Instances newData = Filter.useFilter(dataset, sp);
		//save
		ArffSaver saver = new ArffSaver();
		saver.setInstances(newData);
		saver.setFile(new File("./ArffSamples/iris1.arff"));
		saver.writeBatch();
	}  
}
