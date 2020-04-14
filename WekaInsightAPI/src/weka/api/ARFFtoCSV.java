package weka.api;

//importing required classes//
import weka.core.Instances;
import weka.core.converters.ArffLoader;
import weka.core.converters.CSVSaver;
import java.io.File;
//------------------------//


public class ARFFtoCSV {
	public static void main(String args[]) throws Exception{
		//Load ARFF
		ArffLoader loader = new ArffLoader();
		loader.setSource(new File("./ArffSamples/diabetes.arff"));
		Instances data = loader.getDataSet();
		
		//save CSV
		CSVSaver saver = new CSVSaver();
		saver.setInstances(data);	//set the dataset we want to convert
		
		//save as CSV

		saver.setFile(new File("./CSVsamples/diabetes.csv"));
		saver.writeBatch();
	}

}
