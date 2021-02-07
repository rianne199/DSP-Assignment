import ballerina/io;
import ballerina/http;
//import ballerina/lang.'int;


//interface
http:Client fieEndpoint = check new ("http://localhost:8080");
http:Client studentEndpoint = check new ("http://localhost:8082");
http:Client supervisorEndpoint = check new ("http://localhost:8083");
http:Client HODEndpoint = check new ("http://localhost:8084");
http:Client HDCEndpoint = check new ("http://localhost:8085");

public function main () {

        io:println("WELCOME TO THE POST GRADUATE MENU  ");
        io:println("#####################################");
        io:println("1.POST GRADUATE STUDENT");
        io:println("2.SUPERVISOR");
        io:println("3.HEAD OF DEPARTMENT");
        io:println("4.FACULTY OF INTERNAL EXAMINER  ");
        io:println("5.HIGHER DEGREE COMMITEE ");
        io:println("#####################################");

       string choice = io:readln("Enter a choice :");

       if (choice === "1"){
              io:println("WELCOME TO THE POST GRADUATE MENU");
                    io:println("########################");
                    io:println("1.Submit your Application ");
                    io:println("2.Submit Proposal  ");

                  string option = io:readln("\nSelect your choice\n");

                    match option {
                        "1" => { 
                            
                             string name = io:readln("Enter your name :");
                             string program  = io:readln("Enter your Course:");
                             string Student_No = io:readln("Enter Student Numb :");
                             string contactNo  = io:readln("Enter your contact Number :");
                        
                          var  response = studentEndpoint->post("/graphql",{ query: " { studentProducerd(name:\""+name+"\",program:\""+program+"\",Student_No:\""+Student_No+"\",contactNo:\""+contactNo+"\") }" });
        
                                if (response is  http:Response) {
                                    var jsonResponse = response.getJsonPayload();

                                    if (jsonResponse is json) {
                                        
                                        io:println(jsonResponse);
                                    } else {
                                        io:println("Invalid payload received:", jsonResponse.message());
                                    }

                                }
                        
                        }
                        "2" => { 
                            string studentNo = io:readln("Student No :");
                            string background = io:readln("BackGround :");
                             string probStat  = io:readln("Enter  Problem Statement :");
                             string Obj = io:readln("Enter Objectives :");
                             string ScopeLimit  = io:readln("Enter  Scope Limitation :");
                        
                          var  response = studentEndpoint->post("/graphql",{ query: " { studentProposal(studentNo:\""+studentNo+"\",background:\""+background+"\",probStat:\""+probStat+"\",ScopeLimit:\""+ScopeLimit+"\") }" });
        
                                if (response is  http:Response) {
                                    var jsonResponse = response.getJsonPayload();

                                    if (jsonResponse is json) {
                                        
                                        io:println(jsonResponse);
                                    } else {
                                        io:println("Invalid payload received:", jsonResponse.message());
                                    }

                                }
                        



                        }
                    }


             //accessing the graphql service vID 
           

       }else if (choice=="2"){

        io:println("WELCOME TO    Supervisor");
                    io:println("################################");
                    io:println("1.Accept Application ");
                    io:println("2.Accept Proposal  ");

                  string option = io:readln("\nEnter a choice\n");

                    match option {
                        "1" => { 
                       //accept supervisor
                             string Student_No = io:readln("Enter Student No :");
                             string supervisorID  = io:readln("Enter  Supervisor ID :");
                        
                             var  response = supervisorEndpoint->post("/graphql",{ query: " { supervisorProducerd(Applicant_ID:\""+Student_No+"\",supervisorID:\""+supervisorID+"\") }" });
        
                                if (response is  http:Response) {

                                    var jsonResponse = response.getJsonPayload();

                                    if (jsonResponse is json) {
                                        
                                        io:println(jsonResponse);

                                    } else {
                                        io:println("Invalid payload received:", jsonResponse.message());
                                    }

                                }
                        
                        }
                        "2" => { 
                        //   accept or deny proposal
                                 string Student_No = io:readln("Enter Student No :");
                                 string supervisorID  = io:readln("Enter  Supervisor ID :");
                                 string Response  = io:readln("Enter  Response :");
                        
                               var  response = supervisorEndpoint->post("/graphql",{ query: " { acceptProposal(Applicant_ID:\""+Student_No+"\",supervisorID:\""+supervisorID+"\",Response:\""+Response+"\") }" });
        
                                if (response is  http:Response) {

                                    var jsonResponse = response.getJsonPayload();

                                    if (jsonResponse is json) {
                                        
                                        io:println(jsonResponse);

                                    } else {
                                        io:println("Invalid payload received:", jsonResponse.message());
                                    }

                                }
                        }
                    }


       }else if (choice === "3"){
          
        io:println("WELCOME TO    HOD");
                    io:println("******************************");
                    io:println("1.Schedule Interview ");
                    io:println("2.Assign FIE  ");

                  string option = io:readln("\nEnter option\n");

                    match option {
                        "1" => { 
                       
                             string Student_No = io:readln("Enter Student No :");
                             string time  = io:readln("Enter  Time For Interview :");
                        
                             var  response = HODEndpoint->post("/graphql",{ query: " { interviewProducer(Applicant_ID:\""+Student_No+"\",time:\""+time+"\") }" });
        
                                if (response is  http:Response) {

                                    var jsonResponse = response.getJsonPayload();

                                    if (jsonResponse is json) {
                                        
                                        io:println(jsonResponse);

                                    } else {
                                        io:println("Invalid payload received:", jsonResponse.message());
                                    }

                                }
                        
                        }
                        "2" => {

                                string Student_No = io:readln("Enter Student No :");
                                string FIEID  = io:readln("Enter  FIEID :");
                            
                                var  response = HODEndpoint->post("/graphql",{ query: " { assignFIE(Applicant_ID:\""+Student_No+"\",FIEID:\""+FIEID+"\") }" });
            
                                    if (response is  http:Response) {

                                        var jsonResponse = response.getJsonPayload();

                                        if (jsonResponse is json) {
                                            
                                            io:println(jsonResponse);

                                        } else {
                                            io:println("Invalid payload received:", jsonResponse.message());
                                        }

                                    }


                         }
                    }


           }else if (choice === "4"){
          
        io:println("WELCOME TO    FIE");
                    io:println("******************************");
                    io:println("1.Review Proposal ");
                    

                  string option = io:readln("\nEnter option\n");

                    match option {
                        "1" => { 
                       
                             string Student_No = io:readln("Enter Student No :");
                             string approve  = io:readln("Sanction FIE approve :");
                        
                             var  response = fieEndpoint->post("/graphql",{ query: " { fieApprove(Student_No:\""+Student_No+"\",approve:\""+approve+"\") }" });
        
                                if (response is  http:Response) {

                                    var jsonResponse = response.getJsonPayload();

                                    if (jsonResponse is json) {
                                        
                                        io:println(jsonResponse);

                                    } else {
                                        io:println("Invalid payload received:", jsonResponse.message());
                                    }

                                }
                        
                        }
                        "2" => {

                                string Student_No = io:readln("Enter Student No :");
                                string FIEID  = io:readln("Enter  FIEID :");
                            
                                var  response = HODEndpoint->post("/graphql",{ query: " { assignFIE(Applicant_ID:\""+Student_No+"\",FIEID:\""+FIEID+"\") }" });
            
                                    if (response is  http:Response) {

                                        var jsonResponse = response.getJsonPayload();

                                        if (jsonResponse is json) {
                                            
                                            io:println(jsonResponse);

                                        } else {
                                            io:println("Invalid payload received:", jsonResponse.message());
                                        }

                                    }


                         }
                    }


           }else if (choice == "5"){
                io:println("WELCOME TO    HDC");
                    io:println("******************************");
                    io:println("1.Accept Proposal  ");

                  string option = io:readln("\nEnter option\n");

                    match option {
                        "1" => { 
                      //   accept or deny proposal
                                 string Student_No = io:readln("Enter Student No :");
                               
                                 string Response  = io:readln("Enter  Response :");
                        
                               var  response = HDCEndpoint->post("/graphql",{ query: " { acceptProposal(Applicant_ID:\""+Student_No+"\",Response:\""+Response+"\") }" });
        
                                if (response is  http:Response) {

                                    var jsonResponse = response.getJsonPayload();

                                    if (jsonResponse is json) {
                                        
                                        io:println(jsonResponse);

                                    } else {
                                        io:println("Invalid payload received:", jsonResponse.message());
                                    }

                                }
                        
                        }
                        "2" => { 
                      
                        }
                    }


           }

      //     io:println("Have you registered to vote ");
      //   io:println("WELCOME TO     VOTO");
      //   io:println("******************************");
      //   io:println("1.Register as candidate");
      //   io:println("2.Register as voter");
      //   io:println("3.Vote");
      //   io:println("4.Projections");
      //   io:println("5.get results");

        
      //  string choice = io:readln("Enter choice :");

      //  if (choice === "1"){
      //      //**************register candidate **********************
      //      string name = io:readln("Enter Name :");
      //      string nam_id  = io:readln("Enter Namibian ID  :");
      //      string ruling_party  = io:readln("Enter Ruling  Party  :");

      //      int|error id = 'int:fromString(nam_id);  
             
      //        var  response = clientEndpoint->post("/graphql",{ query: " { register_candidate(name:\"tinashe\",id:1,ruling_party:\"swapo\") }" });
      //      // io:println(response);
      //       if (response is  http:Response) {
      //           var jsonResponse = response.getJsonPayload();

      //           if (jsonResponse is json) {
                    
      //               io:println(jsonResponse);
      //           } else {
      //               io:println("Invalid payload received:", jsonResponse.message());
      //           }

      //        }
      //      }else if(choice === "2"){
      //           //**************register voter **********************
      //      string name = io:readln("Enter Name :");
      //      string nam_id  = io:readln("Enter voter ID  :");
           
      //      int|error id = 'int:fromString(nam_id);  

      //        var  response = clientEndpoint->post("/graphql",{ query: " { register_vote(name:\"tinashe\",namibian_id:4) }" });
      //      // io:println(response);
      //       if (response is  http:Response) {
      //           var jsonResponse = response.getJsonPayload();

      //           if (jsonResponse is json) {
                    
      //               io:println(jsonResponse);
      //           } else {
      //               io:println("Invalid payload received:", jsonResponse.message());
      //           }

      //        }
      //      }else if(choice === "3"){
      //           //**************register voter **********************
                
      //      string name = io:readln("Enter voter ID :");
      //      string nam_id  = io:readln("Enter  candidate id  :");
           
      //      int|error id = 'int:fromString(nam_id);  
           

      //        var  response = clientEndpoint->post("/graphql",{ query: " { vote(voterID:1,candidateID:4) }" });
      //      // io:println(response);3
      //       if (response is  http:Response) {
      //           var jsonResponse = response.getJsonPayload();

      //           if (jsonResponse is json) {
                    
      //               io:println(jsonResponse);
      //           } else {
      //               io:println("Invalid payload received:", jsonResponse.message());
      //           }

      //        }
      //      }



}