# ubuntu-jdk-xml

##[Xalan 2.7.2](http://xalan.apache.org/xalan-j/index.html)
	* Installed in /opt/xalan-j_2_7_2

##[Apache Xerces2 Java 2.11](http://xerces.apache.org/xerces2-j/samples.html)
	* Installed in /usr/share/java
	
##[Saxon-HE 9.7](http://www.saxonica.com/documentation/#!using-xsl/commandline)
	* Installed in /opt/SaxonHE
	* Example from the command line: java net.sf.saxon.Transform -s:source -xsl:stylesheet -o:output

##Run
	* Change to directory containing your XML and XSL files (simplest use)
	* docker run -it -v $PWD:/work bassoman/ubuntu-jdk-xml /bin/bash
	* Once in container, change to /work and use any example command listed above
