package weka.api;

import weka.core.Instances;
import weka.core.converters.ArffSaver;

import java.io.BufferedReader;
//import java.io.BufferedReader; <<--alternate means of retrieval-->> to be tested later
import java.io.File;
//import java.io.FileReader; <<--alternate means of retrieval-->> to be tested later
import java.io.FileReader;
import java.io.IOException;

import weka.core.converters.ConverterUtils.DataSource;
public class LoadSaveData {
	public static void main(String args[]) throws Exception{
		
/*		DataSource source = new DataSource("./ArffSamples/diabetes.arff");
		Instances dataset = source.getDataSet();*/
		String filePath = "./ArffSamples/iris.arff";
		Instances dataset = new Instances(new BufferedReader(new FileReader(filePath))); // <<--alternate means of retrieval-->> to be tested later
		
		System.out.println(dataset.toSummaryString());
		
		ArffSaver saver = new ArffSaver();
		saver.setInstances(dataset);
		CheckIfExists(filePath, saver, 0);
	}
	
	static boolean CheckIfExists(String filePath, ArffSaver saver,int i) {
		
		File tempFile = new File(filePath);
		boolean exists = tempFile.exists();
		if(exists == false) {
     		try {
     			if(i<1) {
				saver.setFile(new File("./ArffSamples/iris.arff"));
	    		saver.writeBatch();
     			}else {
    				saver.setFile(new File("./ArffSamples/iris("+i+").arff"));
    	    		saver.writeBatch();
     			}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}else {
			i++;
			CheckIfExists("./ArffSamples/iris("+i+").arff",saver,i);
		}
		
		
		return exists;
	}

}
