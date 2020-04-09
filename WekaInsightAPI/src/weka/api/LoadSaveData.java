package weka.api;

import weka.core.Instances;
import weka.core.converters.ArffSaver;

//import java.io.BufferedReader; <<--alternate means of retrieval-->> to be tested later
import java.io.File;
//import java.io.FileReader; <<--alternate means of retrieval-->> to be tested later

import weka.core.converters.ConverterUtils.DataSource;
public class LoadSaveData {
	public static void main(String args[]) throws Exception{
		
		DataSource source = new DataSource("/ArffSamples/diabetes.arff");
		Instances dataset = source.getDataSet();
		//Instances dataset = new Instances(new BufferedReader(new FileReader("/ArffSamples/diabetes.arff"))); <<--alternate means of retrieval-->> to be tested later
		
		System.out.println(dataset.toSummaryString());
		
		ArffSaver saver = new ArffSaver();
		saver.setInstances(dataset);
		saver.setFile(new File("/ArffSamples/diabetes.arff"));
		saver.writeBatch();
	}

}
