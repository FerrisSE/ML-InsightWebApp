<p id=result></p>

<script type="text/javascript">

//import required classes
using weka.core.Instances;
using weka.core.converters.ConverterUtils.DataSource;
using weka.classifiers.bayes.NaiveBayes;
using weka.classifiers.trees.J48;
using weka.classifiers.functions.SMO;

		//load dataset
		DataSource source = new DataSource("./CSVsamples/trainFile.csv");
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

</script>