---
title: "Java development"
summary: "Installation, libraries, tools."
date: 2020-01-10
weight: 10
math: false
toc: true
draft: true
---

# Java

## Install

```
$ sudo add-apt-repository universe
$ sudo apt-get install openjdk-16-jdk

[~/.bashrc]
export JAVA_HOME=/usr/lib/jvm/java-16-openjdk-amd64/
```

## Libraries

* Lombok
* Paguro

## Testing

* JUnit + [AssertJ](https://assertj.github.io/doc/)
* or TestNG

## Code quality

### Complexity

[Code Climate](https://codeclimate.com) for cognitive complexity.
(For cyclometric complexity and other metrics, go to `Repo settings > Plugins` and look for a language-specific plugin.)

### Test coverage

JaCoCo
```
[pom.xml]
<plugin>
	<groupId>org.jacoco</groupId>
	<artifactId>jacoco-maven-plugin</artifactId>
	<version>0.8.7</version>
	<executions>
		<execution>
			<id>report</id>
			<phase>test</phase>
			<goals>
				<goal>report</goal>
			</goals>
		</execution>
	</executions>
</plugin>

$ mvn clean test jacoco:report  
```
Then inspect `target/site/jacoco/index.html`.

### Secure dependencies

[Snyk](https://snyk.io)

https://snyk.io/blog/snyk-for-secure-java-development/

### Others

Spotbugs

Sonarqube: static code analysis

Linter for consistent style

## Debugging

* At point of interest (e.g. wrong output), throw an exception, so you get a quick peak at the stack trace. Ignore the rest.
