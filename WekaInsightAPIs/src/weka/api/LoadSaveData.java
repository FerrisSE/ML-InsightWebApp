package weka.api;

import weka.core.Instances;
import weka.core.converters.ArffSaver;

import java.io.BufferedReader;
//import java.io.BufferedReader; <<--alternate means of retrieval-->> to be tested later
import java.io.File;
//import java.io.FileReader; <<--alternate means of retrieval-->> to be tested later
import java.io.FileReader;
import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.swing.JFrame;

import FileAccess.Display;
import weka.core.converters.ConverterUtils.DataSource;


public class LoadSaveData extends HttpServlet {
	
	private static Instances dataset;
	public static void main() throws Exception{
		
//		Instances dataset = new Instances(new BufferedReader(new FileReader(filePath))); // <<--alternate means of retrieval-->> to be tested later
		
        JFrame frame = new JFrame("My GUI");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().add(new Display());
        frame.pack();
      //  frame.setVisible(true);
		
		File file = Display.getFile();
		
		 dataset = new Instances(new BufferedReader(new FileReader(file))); // <<--alternate means of retrieval-->> to be tested later

		
		
		System.out.println(dataset.toSummaryString());
		
//		ArffSaver saver = new ArffSaver();
//		saver.setInstances(dataset);
//		CheckIfExists(filePath, saver, 0);
	}
	
	public static String getResults() {
		try {
		
			System.out.println(dataset.toSummaryString());
			return dataset.toSummaryString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "weka load failed";
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
