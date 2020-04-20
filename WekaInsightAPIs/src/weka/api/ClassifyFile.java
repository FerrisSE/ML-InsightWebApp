package weka.api;
//import required classes
import weka.core.Instance;
import weka.core.Instances;
import weka.core.converters.ArffLoader;
import weka.core.converters.ConverterUtils.DataSource;
import weka.classifiers.bayes.NaiveBayes;
import weka.classifiers.functions.SMOreg;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

public class ClassifyFile{
	public static void main(String args[]) throws Exception{
		//load training dataset
		//DataSource source = new DataSource("./ArffSamples/weather.numeric.arff");
		ArffLoader source = new ArffLoader();
				
		Instances trainDataset = new Instances(new BufferedReader(new FileReader("/ArffSamples/diabetes.arff")));
		
		//Instances trainDataset = source.getDataSet();	
		//set class index to the last attribute
		trainDataset.setClassIndex(trainDataset.numAttributes()-1);

		//build model
		SMOreg smo = new SMOreg();
		smo.buildClassifier(trainDataset);
		//output model
		System.out.println(smo);

		//load new dataset
	//	DataSource source1 = new DataSource("/ArffSamples/weather.numeric.arff");
	//	Instances testDataset = source1.getDataSet();	
		//set class index to the last attribute
		trainDataset.setClassIndex(trainDataset.numAttributes()-1);

		//loop through the new dataset and make predictions
		System.out.println("===================");
		System.out.println("Actual Class, SMO Predicted");
		for (int i = 0; i < trainDataset.numInstances(); i++) {
			//get class double value for current instance
			double actualValue = trainDataset.instance(i).classValue();

			//get Instance object of current instance
			Instance newInst = trainDataset.instance(i);
			//call classifyInstance, which returns a double value for the class
			double predSMO = smo.classifyInstance(newInst);

			System.out.println(actualValue+", "+predSMO);
		}

		/*
		//load training dataset
		DataSource source = new DataSource("/home/likewise-open/ACADEMIC/csstnns/Desktop/iris.arff");
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
		DataSource source1 = new DataSource("/home/likewise-open/ACADEMIC/csstnns/Desktop/iris-unknown.arff");
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
		}
		 */
	}
}