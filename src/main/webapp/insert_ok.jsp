<%@page import="com.mongodb.client.model.Updates"%>
<%@page import="com.mongodb.client.model.Filters"%>
<%@page import="org.bson.conversions.Bson"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="java.util.*"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<%
	request.setCharacterEncoding("EUC-KR");
	int port = 27017;
	
	String db = "db01";
	String collection = "people";
	
	MongoClient mongoClient = new MongoClient("localhost", port);
	MongoDatabase mongoDB = mongoClient.getDatabase(db);
	MongoCollection<Document> c = mongoDB.getCollection(collection);
	
	System.out.println("insert_ok 연결 성공 ! ");
	
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String salary = request.getParameter("salary");
	
	insert(mongoClient, mongoDB, c, name, age, salary);

%>

<%!

	public void insert(MongoClient mongoClient, MongoDatabase mongoDB, MongoCollection<Document> collection,
			String name, int age, String salary) {
		
		Document document = new Document();
		
		document.append("name", name);
		document.append("age", age);
		document.append("salary", salary);
		
		collection.insertOne(document);
		System.out.println("==> InsertOneResult " + name + " , " + age + " , " + salary);
	}


%>

<body>

	<a href="main.jsp">메인 페이지로 가기</a> <br/><br/>
	<a href="read.jsp">전체 결과 보기</a>
</body>
</html>