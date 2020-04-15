
package weka.api;
//import required classes
import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;
import weka.classifiers.bayes.NaiveBayes;
import weka.classifiers.trees.J48;
import weka.classifiers.functions.SMO;
public class Classification{
	public static void main(String args[]) throws Exception{
		//load dataset
		DataSource source = new DataSource("./ArffSamples/iris.arff");
		Instances dataset = source.getDataSet();	
		//set class index to the last attribute
		dataset.setClassIndex(dataset.numAttributes()-1);
		
		System.out.println("//////// NaiveBayes classifier \\\\\\\\");
		//create and build the classifier!
		NaiveBayes nb = new NaiveBayes();
		nb.buildClassifier(dataset);
		//print out capabilities
		
		System.out.println(nb.getCapabilities().toString());
		
		System.out.println("//////// SVM Classifer \\\\\\\\");
		
		SMO svm = new SMO();
		svm.buildClassifier(dataset);
		System.out.println(svm.getCapabilities().toString());
		
		System.out.println("//////// Decision Tree \\\\\\\\");
		
		
		String[] options = new String[4];
		options[0] = "-C"; options[1] = "0.11";
		options[2] = "-M"; options[3] = "3";
		J48 tree = new J48();
		tree.setOptions(options);
		tree.buildClassifier(dataset);
		System.out.println(tree.getCapabilities().toString());
		System.out.println(tree.graph());
		
	}
}