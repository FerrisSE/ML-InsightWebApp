package service;

import java.io.BufferedReader;
import java.io.File;
//import java.io.BufferedReader; <<--alternate means of retrieval-->> to be tested later

//import java.io.FileReader; <<--alternate means of retrieval-->> to be tested later
import java.io.FileReader;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import weka.classifiers.bayes.NaiveBayes;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;

public class NominalPrediction {
		public static String nominalSetPrediction() {
			String  testResult = "";
			String result = "";
			int count = 0;
			int total = 0;
			//Instances trainDataset;
			
			try {
			//load training dataset
			DataSource source = new DataSource("./ArffSamples/iris.arff");
			//Instances trainDataset = new Instances(new BufferedReader(new FileReader("./ArffSamples/iris.arff")));
			System.out.println("file pulled");
			Instances trainDataset = source.getDataSet();	
			//set class index to the last attribute
			trainDataset.setClassIndex(trainDataset.numAttributes()-1);
			//get number of classes
			int numClasses = trainDataset.numClasses();
			//print out class values in the training dataset
			for(int i = 0; i < numClasses; i++){
				//get class string value using the class index
				String classValue = trainDataset.classAttribute().value(i);
				System.out.println("Class Value "+i+" is " + classValue);
			}
			//create and build the classifier
			NaiveBayes nb = new NaiveBayes();
			nb.buildClassifier(trainDataset);
			//load new dataset
			DataSource source1 = new DataSource("./ArffSamples/iris-unknown.arff");
			System.out.println("=========DataSource Selected==========");
			Instances testDataset = source1.getDataSet();	
			//set class index to the last attribute
			testDataset.setClassIndex(testDataset.numAttributes()-1);
			//loop through the new dataset and make predictions
			System.out.println("=========Instances Set==========");
			System.out.println("Actual Class, NB Predicted");
			
			
			for (int i = 0; i < testDataset.numInstances(); i++) {
				 
				//get class double value for current instance
				double actualClass = testDataset.instance(i).classValue();
				//get class string value using the class index using the class's int value
				String actual = testDataset.classAttribute().value((int) actualClass);
				//get Instance object of current instance
				Instance newInst = testDataset.instance(i);
				//call classifyInstance, which returns a double value for the class
				double predNB = nb.classifyInstance(newInst);
				//use this value to get string value of the predicted class
				String predString = testDataset.classAttribute().value((int) predNB);
				result = actual+", "+predString;
				
				if(actual == predString) count++;
							
				System.out.println(result);
		
				testResult= testResult +"\n"+ result;
				total=i;
			}
			System.out.println("===================");
			System.out.println("Actual Class, NB Predicted");

			System.out.println(testResult);
			System.out.println("========= predicted "+count+" of "+total+" samples ==========");
			
		}catch(Exception e) {
			System.out.println("An error occurred. Please make sure that you are using the accepted file formats."+"\n"+"If files are correct, please contact support for additional help");
		}
			return testResult;
	}
}
