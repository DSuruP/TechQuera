create database techquera;

create table techquera.user(
	user_id int AUTO_INCREMENT,
	user_name varchar(100) NOT NULL,
	user_email varchar(100) NOT NULL,
	user_password varchar(20) NOT NULL,
	profile_pic varchar(100),
	otp int,
	isverify boolean default false,
	isactive boolean default true,
	PRIMARY KEY(user_id)
);

create table techquera.user_query(
	query_id int AUTO_INCREMENT,
	query varchar(5000) NOT NULL,
	ask_date Date,
	ask_user int,
	isactive boolean default true,
	FOREIGN KEY(ask_user) REFERENCES techquera.user(user_id),
	PRIMARY KEY(query_id)	
);


create table techquera.query_reply(
	reply_id int AUTO_INCREMENT,
	reply varchar(5000) NOT NULL,
	reply_date Date,
	query int,
	reply_user int,
	FOREIGN KEY(query) REFERENCES techquera.user_query(query_id),

	FOREIGN KEY(reply_user) REFERENCES techquera.user(user_id),
	PRIMARY KEY(reply_id)	
);

create table techquera.reply_feedback(
	feedback_id int AUTO_INCREMENT,
	is_right boolean NOT NULL,
	feedback_user int,
	reply int,
	FOREIGN KEY(reply) REFERENCES techquera.query_reply(reply_id),

	FOREIGN KEY(feedback_user) REFERENCES techquera.user(user_id),
	PRIMARY KEY(feedback_id)	
);
