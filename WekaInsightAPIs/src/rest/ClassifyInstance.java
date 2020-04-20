package rest;

//import required classes
import weka.core.Instance;
import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;
import weka.knowledgeflow.steps.Classifier;
import weka.classifiers.bayes.NaiveBayes;
import weka.classifiers.functions.SMOreg;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ClassifyInstance extends HttpServlet{
	private static final long serialVersionUID = 1L;

	private static String results="";

	public static void main(/*String[] args*/) throws Exception{
		System.out.println("main started");
		/*
		 * //load training dataset DataSource source = new
		 * DataSource("./ArffSamples/weather.nominal.arff"); Instances trainDataset =
		 * source.getDataSet(); //set class index to the last attribute
		 * trainDataset.setClassIndex(trainDataset.numAttributes()-1);
		 * 
		 * //build model SMOreg smo = new SMOreg(); smo.buildClassifier(trainDataset);
		 * //output model System.out.println(smo);
		 * 
		 * //load new dataset DataSource source1 = new
		 * DataSource("./ArffSamples/weather.nominal.arff"); Instances testDataset =
		 * source1.getDataSet(); //set class index to the last attribute
		 * testDataset.setClassIndex(testDataset.numAttributes()-1);
		 * 
		 * //loop through the new dataset and make predictions
		 * System.out.println("===================");
		 * System.out.println("Actual Class, SMO Predicted"); for (int i = 0; i <
		 * testDataset.numInstances(); i++) { //get class double value for current
		 * instance double actualValue = testDataset.instance(i).classValue();
		 * 
		 * //get Instance object of current instance Instance newInst =
		 * testDataset.instance(i); //call classifyInstance, which returns a double
		 * value for the class double predSMO = smo.classifyInstance(newInst);
		 * 
		 * System.out.println(actualValue+", "+predSMO); }
		 */

		

	//	Instances dataset = new Instances(new BufferedReader(new FileReader("./ArffSamples/iris.arff")));		
			
	//	System.out.println(dataset.toSummaryString());
			
		
		
		DataSource source = new DataSource("./ArffSamples/iris.arff");
		System.out.println("DateSource retrieved");
		Instances trainDataset = source.getDataSet();	
		System.out.println("DateSource retrieved");
		//set class index to the last attribute
		trainDataset.setClassIndex(trainDataset.numAttributes()-1);
		//get number of classes
		results="";
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
		Instances testDataset = source1.getDataSet();	
		//set class index to the last attribute
		testDataset.setClassIndex(testDataset.numAttributes()-1);
		//loop through the new dataset and make predictions
		System.out.println("===================");
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
			System.out.println(actual+", "+predString);
			results = actual+", "+predString;
		}
	}
	
	
	public static String getResults() {
		return results;
	}
	
	
	
}