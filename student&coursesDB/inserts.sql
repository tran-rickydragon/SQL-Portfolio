--degrees
INSERT INTO atbl_degrees (degreeName, degreeType, degreeYear, School)
VALUES ('Computer Science', 'Bachelor', '2022-2023', 'COLLEGE OF NATURAL SCIENCES & MATHEMATICS'), 
		('Digital Media', 'Bachelor', '2020-2021', 'COLLEGE OF TECHNOLOGY'),
		('Digital Media', 'Minor', '2020-2021', 'COLLEGE OF TECHNOLOGY');
--cosc
INSERT INTO courses (courseNo, courseName, creditHours, lectureContactHours, labContactHours, formerly, prerequisite, corequisite, courseDescription, repeatability, coreCategory, TCCNS, note, additionalFee) VALUES
	('COSC 1336', 'Computer Science Programming', '3', '3', '0', '', 'A grade of C- or better in MATH 1314 or equivalent.', '', 'Introduction to problem solving through computer programming. Students will learn the fundamental principles of computer science, basic hardware and software components of a computer system, computational thinking, basic algorithms, and programming concepts. Students will get hands-on experience in problem solving by designing, writing, testing and debugging programs in a modern programming language.', '0', '(90) Core-Math/Reasoning, Component Area Option', 'COSC 1336', '', '1'),
	('COSC 1437', 'Introduction to Programming', '4', '3', '1', '', 'A grade of C- or better in COSC 1336, and credit for or concurrent enrollment in MATH 2413.', 'MATH 2413', 'Fundamental concepts of structured programming; procedures and elementary data structures with a focus on problem solving strategies and implementation; computer organization, structured procedural programming, C/C++ programming language, and algorithm design.', '0', '', 'COSC 1437', '', '0'),
	('COSC 2436', 'Programming & Data Structures', '4', '3', '1', '', 'A grade of C- or better in COSC 1437 and credit for or concurrent enrollment in MATH 2414.', '', 'Introduction to fundamental data structures: arrays, lists, stacks, queues, hash tables, trees; sorting and searching; graph algorithms; design, analysis, and comparison of algorithms. Correctness verification techniques such as assertions and invariants. Review program specification, unit testing, and debugging.', '0', '', 'COSC 2436', '', '0'),
	('COSC 2425', 'Computer Organization and Architecture', '4', '3', '1', '', 'A grade of C- or better in COSC 1437.', '', 'Low-level computer design, basics of digital design, and hardware/software interface; Principles of pipelining and caching, instruction pipelining, SIMD and multiprocessor systems.', '0', '', 'COSC 2425', '', '0'),
	('COSC 3360', 'Fundamentals of Operating Systems', '3', '3', '0', '', 'COSC majors and minors: A grade of C- or better in COSC 2436 and COSC 2425; CpE majors: A grade of C- or better in COSC 2320 AND ECE 5367.', '', 'Operating system; sequential processes, concurrent processes, deadlock, mutual exclusion, semaphores; memory management, processor management, peripheral device management.', '0', '', '', 'COSC majors and minors and CpE majors only.', '1'),
	('COSC 3336', 'Computing Structures', '3', '3', '0', '', 'A grade of C- or better in MATH 2318 or MATH 3321, and COSC 2425.', '', 'Introduce methods of reasoning used in computer science; logical notation and proof methods; induction and recursion; sets, functions, and relations; graphs; the growth of functions; annotated programs and loop invariants.', '0', '', '', '', '0'),
	('COSC 3340', 'Intro to Automata & Computability', '3', '3', '0', '', 'A grade of C- or better in MATH 3336, and COSC 2320 or COSC 2436.', '', 'Introduction to automata theory (finite-state automata, push-down automata, Turing machines); formal systems (regular and context-free languages and grammars); computability, Church-Turing thesis.', '0', '', '', 'Declared Computer Science majors and minors, and Computer Engineering majors only.', '1'),
	('COSC 3320', 'Algorithms & Data Structures', '3', '3', '0', '', 'A grade of C- or better in MATH 3336, and COSC 2320 or COSC 2436.', '', 'Algorithm analysis and design, heuristics; advanced tree structures; advanced hashing techniques; sorting and searching; graphs, sets. NP-Completeness, Time and Space complexities.', '0', '', '', 'Declared Computer Science majors and minors only.', '1'),
	('COSC 3380', 'Database Systems', '3', '3', '0', '', 'A grade of C- or better in COSC 2320 or COSC 2436.', '', 'Declared Computer Science majors and minors, and Computer Engineering majors. Database design with ER model, relational model and normalization up to 3NF/BCNF normal forms. Relational algebra and basic SQL queries combining filters, joins and aggregations. SQL transaction processing. Overview of DBMS internal subsystems including: storage, indexing, query optimizer, locking, recovery manager, security mechanisms. Database application development.', '0', '', '', 'Declared Computer Science majors and minors, and Computer Engineering majors only.', '1'),
	('COSC 4351', 'Fundamentals of Software Engineering ', '3', '3', '0', '', 'COSC majors and minors: A grade of C- or better in COSC 3320 and MATH 3336; CpE majors: A grade of C- or better in COSC 2320 and MATH 3336.', '', 'Introduction to the concepts of software engineering. Identification of problems related to the development of large software systems. Software project planning, requirements analysis, design, implementation, quality assurance and maintenance.', '0', '', '', '', '1'),
	('COSC 4353', 'Software Design', '3', '3', '0', '', 'A grade of C- or better in COSC 3320, and MATH 3336 or COSC 3336.', '', 'Object-oriented paradigm, classes, object relationship, software architecture, object modeling technique, design metrics, software development patterns, practices, and principles.', '0', '', '', 'Declared Computer Science majors and minors only.', '1'),
	('COSC XXX', 'COSC Advanced Elective', '3', '3', '0', '', '', '', '', '', '', '', '', ''),
	('COSC 3337', 'Data Science I', '3', '3', '0', 'COSC 4335.', 'A grade of C- or better in COSC 2306 or COSC 2436, and MATH 3339 and declared COSC major, COSC minor, or Data Science minor.', '', 'Data science concepts including exploratory data analysis, data visualization, statistical inference and modeling, machine learning, clustering, post-processing and interpreting results.', '0', 'COSC Advanced Elective', '', 'Formerly COSC 4335.', '1'),
	('COSC 4337', 'Data Science II', '3', '3', '0', '', 'A grade of C- or better in COSC 3337 and declared COSC major, COSC minor, or Data Science minor.', '', 'Emphasis on practical techniques for working with large-scale data. Advanced machine learning topics such as Neural Networks and Deep Learning, ensemble learning approaches and model evaluation.', '0', 'COSC Advanced Elective', '', '', '0'),
	('COSC 3371', 'Cybersecurity', '3', '3', '0', 'COSC 4371', 'A grade of C- or better in COSC 3360.', '', 'Introduction to cybersecurity: theoretical foundations of security, cryptographic algorithms and protocols, widely used security protocols (such as SSL), and practical attack and defense techniques, including software vulnerability exploits and firewalls.', '0', 'COSC Advanced Elective', '', 'Formerly COSC 4371.', '1'),
	('COSC 4315', 'Programming Languages and Paradigms', '3', '3', '0', '', 'A grade of C- or better in COSC 2320 or COSC 2436.', '', 'Discussion and comparison of basic programming styles; their underlying paradigms and languages based on these paradigms; such as imperative and functional programming styles.', '0', 'COSC Advanced Elective', '', '', '1'),
	('COSC 4332', 'Medical Robotics & Image Guided Interventions', '3', '3', '0', '', 'A grade of C- or better in COSC 2320 or COSC 2436.', '', 'Basics of medical robotics as used in image guided interventions and surgeries. Includes robot registration, sensing, kinematics, safety and control, augmented reality, and tele-surgeries.', '0', 'COSC Advanced Elective', '', '', '1'),
	('COSC 4348', 'Introduction to Game Art and Animation', '3', '3', '0', '', 'A grade of C- or better in COSC 2320 or COSC 2436.', '', 'Video game concept arts and computer animation. Modeling game assets and animation using the latest game software and hardware.', '0', 'COSC Advanced Elective', '', '', '1'),
	('COSC 4349', 'Intermediate Game Art and Animation', '3', '3', '0', '', 'A grade of C- or better in COSC 4348.', '', 'Intermediate video game concept arts and computer animation. Advanced topics of modeling game assets and animation, using the latest game software and hardware.', '0', 'COSC Advanced Elective', '', '', '1'),
	('COSC 4354', 'Software Development Practices', '3', '3', '0', '', 'A grade of C- or better in COSC 4353.', '', 'Declared Computer Science majors and minors only. Pragmatics of software development, hands-on iterative, incremental and agile software development team project with emphasis on use of state of the art tools, techniques, principles, and better practices.', '0', 'COSC Advanced Elective', '', '', '1'),
	('COSC 4355', 'Introduction to Ubiquitous Computing', '3', '3', '0', '', 'A grade of C- or better in COSC 4353.', '', 'For Computer Science majors and minors only. Introduction to software development for ubiquitous devices such as PDAs and cell phones.', '0', 'COSC Advanced Elective', '', '', '1'),
	('COSC 4358', 'Introduction to Interactive Game Development', '3', '3', '0', '', 'A grade of C- or better in COSC 2436.', '', 'Team development of interactive video games on state-of-the-art devices.', '0', 'COSC Advanced Elective', '', '', '1'),
	('COSC 4359', 'Intermediate Interactive Game Development', '3', '3', '0', '', ' A grade of C- or better in COSC 4358 and COSC 4370.', '', 'Continuation of the introduction to Interactive Game Development. Advanced theories and practices in game development.', '0', 'COSC Advanced Elective', '', '', '1'),
	('COSC 4364', 'Numerical Methods', '3', '3', '0', '', 'A grade of C- or better in MATH 2318, MATH 3339, and COSC 2320 or COSC 2436.', '', 'Programming numerical solution of problems in linear algebra; system of linear equations, matrix inversion, and Eigenvalue problems, solution of equations, polynomial approximations, and initial value problems of ordinary differential equations.', '0', 'COSC Advanced Elective', '', '', '1'),
	('COSC 4368', 'Fundamentals of Artificial Intelligence', '3', '3', '0', '', 'A grade of C- or better in COSC 2320 or COSC 2436. An overview of main topics in the field of artificial intelligence.', '', 'Topics include search techniques, reasoning with logic, planning, decision making, machine learning, and robotics.', '0', 'COSC Advanced Elective', '', '', '1'),
	('COSC 4370', 'Interactive Computer Graphics', '3', '3', '0', '', 'A grade of C- or better in MATH 2318, and COSC 2320 or COSC 2430.', '', 'Introduction to graphics hardware and software; interactive systems to display three-dimensional objects; display and input devices; and alternative algorithms, system configuration, and design trade-offs.', '0', 'COSC Advanced Elective', '', '', '1'),
	('COSC 4372', 'Fundamentals of Medical Imaging', '3', '3', '0', '', 'A grade of C- or better in COSC 2320 or COSC 2436.', '', 'Medical imaging modalities; principles, data collection, and image reconstruction. X-rays, CT, ultrasound, and MRI. Simulations of image generation.', '0', 'COSC Advanced Elective', '', '', '1'),
	('COSC 4377', 'Introduction To Computer Networks', '3', '3', '0', '', 'A grade of C- or better in COSC 2320 or COSC 2436.', '', 'Data communications; network protocols and architecture; local and wide-area networks; internetworking.', '0', 'COSC Advanced Elective', '', '', '1'),
	('COSC 4390', 'Internet Computing', '3', '3', '0', '', 'A grade of C- or better in COSC 2320 or COSC 2436.', '', 'Web based technologies, client/server computing, HTTP, JavaScript and related libraries/frameworks/ platforms, event handling and network-programming.', '0', 'COSC Advanced Elective', '', '', '1'),
	('COSC 4393', 'Digital Image Processing', '3', '3', '0', '', 'A grade of C- or better in COSC 2320 or COSC 2436.', '', 'Essential concepts of digital image processing, image acquisition and processing, practical applications, and elementary image analysis algorithms.', '0', 'COSC Advanced Elective', '', '', '1'),
	('COSC 4397', 'Sel Top-Computer Science', '3', '3', '0', '', 'Advanced standing and consent of instructor.', '', 'Selected topics in major areas of computer science not covered in detail in any of the courses in the regular computer science program.', '', '', '', 'May be repeated for credit with approval of chair.', '1');

--digm
INSERT INTO courses (courseNo, courseName, creditHours, lectureContactHours, labContactHours, formerly, prerequisite, corequisite, courseDescription, repeatability, coreCategory, TCCNS, note, additionalFee) VALUES
	('DIGM 1300', 'Introduction to Digital Media', '3', '3', '0', '', 'None.', '', 'An introduction to the field of Digital Media, including digital imaging and design, print publishing, web publishing, and the business environment.', '', '', '', 'Students must pass this course with a C+ or higher to declare digital media as a major.', ''),
	('DIGM 1350', 'Graphics for Digital Media', '3', '0', '6', '', 'C or higher in ENGL 1301 or ENGL 1302 or credit for AP English Language and Composition.', '', 'Pixel-based and vector graphics for use in print and digital media.', '0', '', '', '', '1'),
	('DIGM 1376', 'User Experience (UX) Principles', '3', '3', '0', '', 'Declared Digital Media or Computer Information System major or minor.', '', 'History and evolution of UX research and the primary research methods used by usability researchers.', '', '', '', '', ''),
	('DIGM 2353', 'Page Layout and Design', '3', '2', '3', '', 'A grade of C or better in DIGM 1350, Declared Digital Media major or minor.', '', 'Use of page layout software to create effective documents that follow established principles of design, typography, color, and photography, as well as ethical and legal standards.', '', '', '', '', ''),
	('DIGM 2357', 'Content Strategy & Development', '3', '2', '3', '', 'A grade of C or higher in DIGM 1350 and DIGM 1376.', '', 'Developing a content strategy from a brand perspective. Digital storyboarding for multi-touch, multichannel campaigns using personalized communications software.', '', '', '', '', ''),
	('DIGM 2352', 'Digital Photography', '3', '2', '3', '', 'A grade of C or better in DIGM 1350.', '', 'Digital cameras; photographic principles; image organization, metadata, evaluation, and correction; digital asset management; creating image portfolios for the Web; use of color management to soft/hard-proof finished photographs.', '', '', '', '', ''),
	('CIS 3320', 'Information Visualization', '3', '3', '0', '', 'MATH 1342 or TMTH 3360 or equivalent.', '', 'Information visualization offers instruments for reasoning about quantitative information, analyzing and communicating statistical information. The course overviews the main typologies of data graphics (data-maps, time-series, space-time narrative, relational diagrams, graphs and methods for dimensionality reduction) and provides a language for discussing data visualizations combined with a knowledge of the human perception of visual objects. The course teaches how to visualize information effectively by using statistical methods, combined with knowledge of the human perception and the basics of data graphics.', '0', '', '', '', '0'),
	('DIGM 2325', 'Information Technology Applications for Digital Media', '3', '2', '3', '', 'C+ or better in DIGM 1350.', '', 'Information Technology applications for digital media businesses: business information systems, social technology, data analysis, database concepts and applications, business intelligence, and data management (warehousing, analyzing, mining, and visualization).', '', '', '', '', ''),
	('DIGM 3351', 'Individualized Communication Processes', '3', '2', '3', '', 'ENGL 1301 or ENGL 1302 and Grade of C or better in DIGM 2325 and DIGM 2353.', '', 'Content personalization of print media through static, versioned, and variable delivery methods; engaging with the audience through print and electronic media; the graphic production workflow including traditional, pure digital, and hybrid models; an introduction to tone and color reproduction and color management; and using print production equipment for pre-press, press, and post-press production.', '0', '', '', '', '1'),
	('DIGM 3354', 'Video Production 1', '3', '2', '3', '', 'A grade of C or better in DIGM 2352 or approved equivalent.', '', 'Introduction to digital film and video production from concept development and planning through post-production to delivery. Students must pass a digital photography pretest during the first week of class to continue.', '', '', '', '', ''),
	('DIGM 4372', 'Costing in Digital Media', '3', '2', '3', 'GRTC 4372', 'Grade of C or better in DIGM 2357, DIGM 3351, and DIGM 3354. (DIGM 3354 waived for Graphic Communications Technology Minors).', '', 'Principles and techniques of cost estimation for digital media production.', '', '', '', '', ''),
	('DIGM 4351', 'Portfolio Development for Digital Media', '3', '2', '3', '', 'A grade of C or higher in DIGM 2357, DIGM 3351, and DIGM 3354.', '', 'Students will brand themselves and their careers by completing and polishing their hard-copy portfolios and by using commercially-available online resources to build their online portfolios.', '', '', '', '', ''),
	('DIGM 4378', 'Senior Project', '3', '3', '0', 'GRTC 4378', 'Grade of C or higher in DIGM 4351 or consent of program coordinator.', '', 'Directed research project.', '', '', '', '', ''),
	('DIGM 4379', 'Transmedia Marketing', '3', '2', '3', '', 'Grade of C or higher in DIGM 2357, DIGM 3351, and DIGM 3354.', '', 'The technology, production, and management of creative story-telling authored across multiple media distribution platforms.', '', '', '', '', ''),
	('DIGM 3252', 'Graphic Communication Output', '2', '2', '0', '', 'Grade of C or better in DIGM 2353 or 3351.', '', 'Static and variable-data printing technologies; binding and finishing technologies; materials used in print production; history and significance of printing methodologies.', '', '', '', '', '1'),
	('DIGM 3152', 'Graphic Communication Output Lab', '1', '0', '3', '', 'Credit for or concurrent enrollment in DIGM 3252.', '', 'Laboratory activities and experiments related to digital and conventional graphic communication output.', '', '', '', '', ''),
	('DIGM 3350', 'Graphic Communication Production Processes', '3', '3', '0', '', 'ENGL 1301 or ENGL 1302.', '', 'Production methods used to produce printed items, marketing materials, and packages. Field trips to selected manufacturers. History of graphic communication processes.', '0', '', '', '', ''),
	('DIGM 3355', 'Package Technology', '3', '2', '3', '', ' A grade of C or better in DIGM 1350, DIGM 3152, and DIGM 3252.', '', 'Packaging structures from the perspectives of distribution packaging, materials, product protection, testing methodology, palletization, and designing for various shipping methods and channels. Current Topics in industry trends.', '', '', '', '', ''),
	('DIGM 3356', 'ePublishing', '3', '2', '3', '', 'A grade of C or better in DIGM 2357 and DIGM 3351.', '', 'Design for tablet and mobile device delivery; information technologies for eMedia workflows; use of XML for ePublishing; digital asset management; personalized e-mail blasts.', '', '', '', '', ''),
	('DIGM 3370', 'Two Dimensional Computer Generated Imagery Animation', '3', '2', '3', '', 'A grade of C or better in DIGM 3354.', '', 'Two-dimensional (2D) computer-generated imagery (CGI), including drawing, coloring, and animating objects and characters; phonemes for character dialog; and object-oriented programming.', '', '', '', '', ''),
	('DIGM 3374', 'Video Production 2', '3', '2', '3', '', 'A grade of C or better in DIGM 3354.', '', 'Advanced techniques in digital video production including special effects and motion graphics.', '', '', '', '', '');

--TLIM
INSERT INTO courses (courseNo, courseName, creditHours, lectureContactHours, labContactHours, formerly, prerequisite, corequisite, courseDescription, repeatability, coreCategory, TCCNS, note, additionalFee) VALUES
	('TLIM 3300', 'Leadership and Innovation Fundamentals', '3', '3', '0', '', 'Credit for or concurrent enrollment in TLIM 3363.', '', 'Strategies, practices, and principles of Leadership and Innovation in the workplace with a focus on integrating the functional aspects of innovation.', '0', '', '', 'Student must pass TLIM 3300 with C or better to declare Technology Leadership and Innovation Management major.', ''),
	('TLIM 3330', 'Innovation Principles', '3', '3', '0', '', 'MATH 1324 and (C or better in TLIM 3363 or other approved WID course).', '', 'Methods and processes for creating innovations, leading disruptive change, and overview of innovation systems.', '0', '', '', '', '0'),
	('TLIM 3331', 'Innovation Development', '3', '3', '0', '', 'TLIM 3330.', '', 'Generating innovative ideas; creative stimulus insights for technology and economic, social, and cultural trends; and a systematic approach to creativity.', '', '', '', '', ''),
	('TLIM 3340', 'Organizational Leadership and Supervision', '3', '3', '0', '', 'Credit for or concurrent enrollment in TLIM 3363 (or WID for non majors).', '', 'The supervisory process. Established practices and supporting knowledge of supervisory planning, leading, organizing, and controlling.', '', '', '', '', '1'),
	('TLIM 3345', 'Human Resources in Technology', '3', '3', '0', 'TELS 3345.', 'Credit for or concurrent enrollment in TLIM 3340 or equivalent.', '', 'Functions of personnel administration in human resource development, employee-supervisor relationships, interviewing, recruiting and selection techniques, and training programs.', '', '', '', '', '1'),
	('TLIM 3346', 'Wage & Salary Administration', '3', '3', '0', 'TELS 3346.', 'TELS 2371.', '', 'Concepts, principles, procedures, processes, and programs related to the design of an effective system of compensation.', '', '', '', '', '1'),
	('TLIM 3350', 'Emergency Management Principles', '3', '3', '0', '', 'C or better in TLIM 3340.', '', 'Emergency management, preparedness, mitigation, response, and recovery; integration of local, state, federal and public sector resources; roles and responsibilities of law enforcement, fire service, emergency medical service, public works, public health, and others.', '', '', '', '', '0'),
	('TLIM 3355', 'Project Management Principles', '3', '3', '0', 'TELS 3355.', 'C or better in TLIM 3340.', '', 'Project management processes: core knowledge and skills.', '', '', '', '', '1'),
	('TLIM 3360 ', 'Law and Ethics in Technology & Innovation', '3', '3', '0', 'TELS 2360.', 'C or better in TLIM 3340 or MANA 3335.', '', 'General principles of business law and ethics related to contracts, property, agency, corporations, bankruptcy, mortgages, torts, and the Uniform Commercial Code with emphasis on technology and innovation.', '', '', '', '', ''),
	('TLIM 3363', 'Technical Communications', '3', '3', '0', 'TELS 3363.', 'ENGL 1302 with grade of C or higher.', '', 'Procedures and techniques of preparing technical memoranda, oral and written reports, manuals, and other source documents that fit the pattern of industrial and institutional communications.', '0', '(81) Core-Writing in Discipline WID', '', '', '1'),
	('TLIM 3365', 'Team Leadership', '3', '3', '0', 'TELS 3365.', 'C or better in TLIM 3340 or equivalent.', '', 'Roles, processes, and strategies for team leadership. Creation of collaborative climates for team performance, team member development, leading successful team meetings, and strategies for dealing with global and virtual teams.', '', '', '', '', '1'),
	('TLIM 3371', 'Budgeting and Financial Principles', '3', '3', '0', 'TELS 2371.', 'C or better MATH 1324.', '', 'Concepts, procedures, and processes of recording and presenting financial data for industry. Budgeting, accounting systems, record keeping methodology, financial planning, and fiscal leadership.', '0', '', '', '', '1'),
	('TLIM 3372', 'Communicatn in Sci,Engr & Tech', '3', '3', '0', 'TELS 3372.', 'Three hours in communication course with a grade of C or higher; successful completion of computer application course (i.e. MS Word).', '', 'Analysis of issues and trends in science, engineering, and technology to develop effective communication in the global workforce. Focus on oral and written communications, critical thinking, and research skills using computer-driven technologies.', '', '', '', '', '1');

	--CORE
INSERT INTO courses (courseNo, courseName, creditHours, lectureContactHours, labContactHours, formerly, prerequisite, corequisite, courseDescription, repeatability, coreCategory, TCCNS, note, additionalFee) VALUES
	('ENGL 1301', 'First Year Writing I', '3', '3', '0', '', 'A TSI placement score of at least 340, and an essay score of at least a 4 on the TSI Writing Assessment', '', '', '0', '(10) Core-Communication', 'ENGL 1301', 'Students who score below the minimum on the TSI must enroll concurrently in ENGL 1300 or, if slightly below the minimum writing score, in ENGL 1100. Students who score below the minimum on the TSI Reading Assessment must enroll concurrently in IRW 1300.', '1'),
	('HIST 1301', 'The United States to 1877', '3', '3', '0', 'HIST 1377', '', '', 'The social, economic, and political history of the United States to 1877.', '0', '(60) Core-American History', 'HIST 1301', '', '1'),
	('GOVT 2306', 'US & TX Constitutions and Politics', '3', '3', '0', 'POLS 1336', '', '', 'Introduction to the constitutions and politics of the United States and Texas, emphasizing constitutional structure, federalism, separation of powers, limited government, public opinion, elections, and civil liberties. (Introductory category)', '0', '(70) Core-Government/Political Science', 'GOVT 2306', '', '1'),
	('MATH 2413', 'Calculus I', '4', '3', '3', '', 'Credit for MATH 2312 with a grade of C- or higher, or a satisfactory score on a placement examination.', '', 'Calculus of rational functions, limits, derivatives, applications of the derivative, antiderivatives, the definite integral with applications, mean value theorem, fundamental theorem of calculus, and numerical integration.', '1', '(90) Core-Math/Reasoning, Component Area Option (20) Core-Mathematics', 'MATH 2413', '', '1'),
	('ENGL 1302', 'First Year Writing II', '3', '3', '0', '', 'ENGL 1301 or equivalent.', '', 'Detailed study of the principles of rhetoric as applied to analyzing and writing argumentative and persuasive essays; principles and methods of research, culminating in writing a substantial research paper.', '0', '(10) Core-Communication', 'ENGL 1302', 'Credit may not be received for both ENGL 1302 and ENGL 1310 or ENGL 1370.', '1'),
	('HIST 1302', 'The United States Since 1877', '3', '3', '0', 'HIST 1378', '', '', 'The social, economic, and political history of the United States since 1877.', '0', '(60) Core-American History', 'HIST 1302', '', '1'),
	('GOVT 2305', 'US Gov: Congress, President, & Courts', '3', '3', '0', 'POLS 1377', '', '', 'Introduction to the institutions of government with an emphasis on the congress, the president, and the federal courts. (Introductory category.)', '0', '(70) Core-Government/Political Science', 'GOVT 2305', '', '1'),
	('MATH 2414', 'Calculus II', '4', '3', '3', '', 'Credit for MATH 2413 with a grade of C- or higher.', '', 'Calculus of transcendental functions: additional techniques and applications of integration, indeterminate forms, improper integrals, Taylor�s formula, and infinite series.', '1', '(90) Core-Math/Reasoning, Component Area Option', 'MATH 2414', '', '1'),
	('MATH 2318', 'Linear Algebra', '3', '3', '0', '', 'Credit for or concurrent enrollment in MATH 2414.', '', 'Solutions of systems of linear equations, matrices, vector spaces, linear transformations, similarity, eigenvalues and eigenvectors.', '0', '', 'MATH 2318', '', '1'),
	('MATH 3321', 'Engineering Mathematics', '3', '3', '0', '', 'MATH 2414.', '', 'First order ordinary differential equations and initial value problems; higher order differential equations; vector spaces, matrices, determinants, eigenvectors and eigenvalues; applications to systems of first order equations; Laplace transforms.', '0', '', '', 'Students may not receive credit for both MATH 3321 and MATH 3331.', '1'),
	('MATH 3336', 'Discrete Mathematics', '3', '3', '0', '', 'MATH 2318 or equivalent.', '', 'Topics selected from logic, set theory, combinatorics, and graph theory.', '0', '', '', '', '1'),
	('MATH 3339', 'Statistics for Sciences', '3', '3', '0', '', 'MATH 2414.', '', 'Graphical and descriptive methods in statistics, probability, random variables and distributions, sampling, estimation, hypothesis testing, regression, analysis of variance, exploratory and diagnostics, statistical computing.', '1', '', '', 'Students may not receive credit for both MATH 3339 and MATH 3349.', '1'),
	('MATH 1314 ', 'College Algebra', '3', '3', '0', '', 'None.', '', 'Quadratic equations, inequalities, logarithmic and exponential functions, graphs, elements of theory of equations, systems of equations.', '1', '(20) Core-Mathematics TCCNS Equivalent: MATH 1314', '', 'Quadratic equations, inequalities, logarithmic and exponential functions, graphs, elements of theory of equations, systems of equations.', '1'),
	('MATH 1342', 'Elementary Statistical Methods', '3', '3', '0', '', 'None.', '', 'Probability, correct probabilistic reasoning, distributions, graphical and descriptive methods, sampling estimation, hypotheses and statistical inference.', '0', '(90) Core-Math/Reasoning, Component Area Option (20) Core-Mathematics', '', 'May not apply to course or GPA requirements for a major or minor in the College of Natural Sciences and Mathematics. Students with prior credit for MATH 3338 or MATH 3339 may not enroll in or receive credit for MATH 1342.', '1'),
	('HDCS 1300', 'Human Ecosystems & Tech Change', '3', '3', '0', '', 'ENGL 1302 or equivalent.', '', 'Introduction to the study of human and consumer needs, values, and goals in relationship to natural, man-made, and behavioral systems within the context of dynamic technological change.', '0', '(81) Core-Writing in Discipline WID', '', '', '1'),
	('PHIL 1321', 'Logic I', '', '', '', '', 'MATH 1314.', '', 'Techniques for analyzing statements and evaluating arguments, primarily through use of the apparatus of modern symbolic logic.', '0', '(90) Core-Math/Reasoning, Component Area Option TCCNS Equivalent: PHIL 2303', '', 'May not be taken for credit by students who already have credit for PHIL 2321', '1');

--other cores
INSERT INTO courses (courseNo, courseName, creditHours, lectureContactHours, labContactHours, formerly, prerequisite, corequisite, courseDescription, repeatability, coreCategory, TCCNS, note, additionalFee) VALUES
	('BIOL 1106', 'Biology for Science Majors I (lab)', '1', '0', '3', '', 'Credit for or concurrent enrollment in BIOL 1306.', '', 'Designed for science majors and preprofessional students. Laboratory experience in introductory biological science, including cell structure and function, respiration, photosynthesis, and circulatory, urinary, and reproductive systems.', '0', '', 'BIOL 1106', '', '1'),
	('BIOL 1107', 'Biology for Science Majors II (lab)', '1', '0', '3', '', 'Credit for or concurrent enrollment in BIOL 1307.', '', 'Designed for science majors and preprofessional students. Laboratory experience in mitosis, meiosis, genetics, diversity of life, vertebrate anatomy, ecology, and microevolution.', '0', '', 'BIOL 1107', '', '1'),
	('BIOL 1306', 'Biology for Science Majors I (lecture)', '3', '3', '0', '', 'MATH 1314 or equivalent.', '', 'BIOL 1306 is the first semester of a two-part Introduction to Biological Science course and focuses on biochemistry, cell biology and physiology.', '0', '(30) Core-Life & Physical Sciences', '', '', '1'),
	('BIOL 1307', 'Biology for Science Majors II (lecture)', '3', '3', '0', '', 'MATH 1314 or equivalent.', '', 'BIOL 1307 is the second semester of a two-part Introduction to Biological Science course and focuses on genetics, biotechnology, evolution and ecology.', '0', '(30) Core-Life & Physical Sciences', '', '', '1'),
	('CHEM 1105', 'Foundations of Chemistry Laboratory', '1', '0', '3', 'CHEM 2115', 'CHEM 2115', 'CHEM 2115', '', '0', '', 'CHEM 1105', 'Credit may not be applied toward a degree for both CHEM 1105 and CHEM 1111 or CHEM 1117.', '1'),
	('CHEM 1111', 'Fundamentals of Chm Lab', '1', '0', '3', '', 'Credit for or concurrent enrollment in CHEM 1311.', '', 'Illustrates and reinforces principles and concepts by use of qualitative and quantitative experiments, emphasizing interpretation and reporting of data and facility in handling scientific instruments.', '0', '', 'CHEM 1111', 'Credit may not be applied toward a degree for both CHEM 1111 and CHEM 1105 or CHEM 1117.', '1'),
	('CHEM 1112', 'Fundamentals of Chm Lab', '1', '0', '3', '', 'CHEM 1111 and credit for or concurrent enrollment in CHEM 1312.', '', 'Illustrates and reinforces principles and concepts by use of qualitative and quantitative experiments, emphasizing interpretation and reporting of data and facility in handling scientific instruments.', '0', '', 'CHEM 1112', 'Credit may not be applied toward a degree for both CHEM 1111; CHEM 1112 and CHEM 1105.', '1'),
	('CHEM 1305', 'Foundations of Chemistry', '3', '3', '0', 'CHEM 2335', 'Credit for or concurrent enrollment in MATH 1314 or MATH 1332.', '', 'Concepts and principles of chemistry.', '0', '(30) Core-Life & Physical Sciences', 'CHEM 1305', 'For science and engineering majors. May not be applied toward a degree until CHEM 1111 is successfully completed. Credit may not be applied to a degree for both CHEM 1311 and CHEM 1305 or CHEM 1372.', '1'),
	('CHEM 1311', 'Fundamentals of Chemistry', '3', '3', '0', '', 'MATH 2312 or equivalent.', '', 'General principles, fundamental laws, atomic & molecular structure, states of matter, & elementary inorganic, nuclear & organic chemistry.', '0', '(30) Core-Life & Physical Sciences', 'CHEM 1311', 'For science and engineering majors. May not be applied toward a degree until CHEM 1112 is successfully completed. Credit may not be applied to a degree for both CHEM 1312 and CHEM 1305.', '1'),
	('CHEM 1312', 'Fundamentals of Chemistry 2', '3', '3', '0', '', 'MATH 2312 or equivalent and CHEM 1311.', '', 'General principles, fundamental laws, equilibrium, kinetics, electrochemistry, and elementary inorganic, nuclear, and organic chemistry.', '0', '(30) Core-Life & Physical Sciences', 'CHEM 1312', 'For science and engineering majors. May not be applied toward a degree until CHEM 1112 is successfully completed. Credit may not be applied to a degree for both CHEM 1312 and CHEM 1305.', '1'),
	('GEOL 1102', 'Introduction to Climate Change Laboratory', '1', '0', '3', '', 'credit for or concurrent enrollment in GEOL 1302.', '', 'Study of climate change processes through the collection of meteorological and geochemical data and analysis of climate related datasets.', '0', '', '', '', '1'),
	('GEOL 1103', 'Physical Geology Lab', '1', '0', '3', '', 'Credit for or concurrent enrollment in GEOL 1303.', 'GEOL 1303.', 'Supplementary to lecture; study of minerals, rocks, and maps.', '0', '', 'GEOL 1103', 'Various field trips will be offered.', '1'),
	('GEOL 1104', 'Historical Geology Lab', '1', '0', '3', '', 'GEOL 1103 and credit for or concurrent enrollment in GEOL 1304.', 'GEOL 1304.', 'Supplementary to lecture; study of rocks, fossils, and maps.', '0', '', 'GEOL 1104', 'Various field trips will be offered.', '1'),
	('GEOL 1302', 'Intro To Global Climate Change', '3', '3', '0', '', 'Credit for, placement out of, or concurrent enrollment in MATH 1314 or MATH 1324 or MATH 1332 (formerly MATH 1310 or MATH 1313, or MATH 1311).', '', 'Examines how past climate records and models provide a better understanding of possible future climate changes. Greenhouse gases, solar output, Earth�s orbit, and anthropogenic effects.', '0', '(30) Core-Life & Physical Sciences', '', '', '1'),
	('GEOL 1303', 'Physical Geology', '3', '3', '0', '', 'Credit for, placement out of, or concurrent enrollment in MATH 1314 or MATH 1324 or MATH 1332 (formerly MATH 1310, or MATH 1313, or MATH 1311).', 'MATH 1314 or MATH 1324 or MATH 1332 (formerly MATH 1310, or MATH 1313, or MATH 1311).', 'Principles of geology; emphasis on surface and internal processes of the earth.', '0', '(30) Core-Life & Physical Sciences', 'GEOL 1303', '', '1'),
	('GEOL 1304', 'Historical Geology', '3', '3', '0', '', 'GEOL 1303, and credit for, placement out of, or concurrent enrollment in MATH 1314 or MATH 1324 or MATH 1332 (formerly GEOL 1330, MATH 1310 or MATH 1313 or MATH 1311).', 'MATH 1314 or MATH 1332.', 'Geologic history of the earth; introduction to the uses of geological principles to interpret earth history.', '0', '(30) Core-Life & Physical Sciences', 'GEOL 1304', '', '1'),
	('ARCH 2350', 'History of the Built Environment I', '3', '2', '3', '', 'History of the Built Environment I', '', 'First part of a two-semester chronological history of the global human-impacted environment, with attention to social, cultural, philosophical, technical, and environmental issues.', '0', '(50) Core-Creative Arts', '', '', '1'),
	('MUSI 1307', 'Listening to Classical Music', '3', '3', '0', '', 'ENGL 1302.', '', 'An introduction to the masterworks of Western music from Gregorian chant to the present.', '0', '(50) Core-Creative Arts', '', '', '1'),
	('PHIL 1361', 'Philosophy and the Arts', '3', '3', '0', '', 'ENGL 1301.', '', 'Introduction to philosophical topics in the visual and performing arts, including criticism, interpretation, moral issues, and cultural contexts.', '0', '(50) Core-Creative Arts', '', '', '1'),
	('AAS 2320', 'Intro To African American Stdy', '3', '3', '0', '', 'ENGL 1301.', 'An introductory analysis of the discipline of African American/African Studies, its mission, key theories and major concerns.', '', '0', '(40) Core-Language, Philosophy & Culture', '', '', '1'),
	('CHIN 3344', 'Modern and Contemporary Global Chinese Literature', '3', '3', '0', '', 'ENGL 1302.', 'This course introduces students to the canon of Chinese literature, and traces the social-politial and cultural transformation of Chinese societies and the global Chinese diaspora through literature.', '', '0', '(81) Core-Writing in Discipline WID, (40) Core-Language, Philosophy & Culture', '', '', '1'),
	('PHIL 1301', 'Intro To Philosophy', '3', '3', '0', '', 'ENGL 1301.', '', 'Introduction to philosophy: issues such as the nature and extent of knowledge, the objectivity of scientific theories, the rationality of theistic belief, and human freedom.', '0', '(40) Core-Language, Philosophy & Culture', '', '', '1'),
	('AAMS 2300', 'Introduction to Asian American Studies', '3', '3', '0', 'CUST 2300.', 'ENGL 1302.', '', 'Introduces students to interdisciplinary analyses of Asian peoples as a �race� and multi-ethnicities in the US. Examines some of the dominant historical experiences and issues that shape Asian American. Explores the diversity and complexity of Asian American histories and experiences within the context of US race and ethnic relations.', '0', '(80) Core-Social & Behavioral Science', '', '', '1'),
	('PSYC 2301', 'Introduction to Psychology', '3', '3', '0', '', 'Credit for or concurrent enrollment in ENGL 1301 or equivalent.', '', 'Principles and theories of psychology including methodology and brief analysis of major content areas ranging from development, perception, and learning to motivation/emotion, personality, and social processes.', '0', '(80) Core-Social & Behavioral Science', 'PSYC 2301', '', '1'),
	('SOCI 1301', 'Introduction To Sociology', '3', '3', '0', '', '', '', 'Major theories, methods; and findings pertaining to the study of societies, institutions, organizations, and groups. The interrelationships of society, culture, and personality.', '0', '(80) Core-Social & Behavioral Science', '', '', '1'),
	('ANTH 2304', 'Intro To Language and Culture', '3', '3', '0', '', 'Concurrent enrollment in or completion of ENGL 1301 or equivalent.', '', 'Anthropological perspectives on the relation of language and culture including social use of language, language as behavior, and non-verbal communication.', '0', '(81) Core-Writing in Discipline WID', '', '', '1'),
	('PHIL 1334', 'Minds and Machines', '3', '3', '0', '', 'ENGL 1301.', '', 'Perspectives on issues from recent sciences of the mind: Is human psychology a product of evolution? Does thought depend on language? Is our visual world constricted by our brains?', '0', '(81) Core-Writing in Discipline WID', '', '', '1');

	--digm missing
INSERT INTO courses (courseNo, courseName, creditHours, lectureContactHours, labContactHours, formerly, prerequisite, corequisite, courseDescription, repeatability, coreCategory, TCCNS, note, additionalFee) VALUES
	('DIGM 3252', 'Graphic Communication Output', '2', '2', '0', '', 'Grade of C or better in DIGM 2353 or 3351.', '', 'Static and variable-data printing technologies; binding and finishing technologies; materials used in print production; history and significance of printing methodologies.', '', '', '', '', '1'),
	('DIGM 3152', 'Graphic Communication Output Lab', '1', '0', '3', '', 'Credit for or concurrent enrollment in DIGM 3252.', '', 'Laboratory activities and experiments related to digital and conventional graphic communication output.', '', '', '', '', '1'),
	('DIGM 4373', 'Photographic Tone and Color Reproduction', '3', '2', '3', '', 'Grade of C or better in DIGM 3252.', '', 'Tone and color theory, measurement, and modification; calibrating and characterizing input and output devices; G7 calibration technology; converting photographs to match output device requirements for black-and-white or color reproduction; outputting images to meet or exceed customer expectations.', '', '', '', '', '1');

INSERT INTO courses (courseNo, courseName, creditHours, lectureContactHours, labContactHours, formerly, prerequisite, corequisite, courseDescription, repeatability, coreCategory, TCCNS, note, additionalFee) VALUES
	('MATH 1324', 'Finite Math with Applications', '3', '3', '0', '', 'None.', '', 'Systems of linear equations, introduction to linear programming, mathematics of finance, topics in probability and statistics.', '0', '(90) Core-Math/Reasoning, Component Area Option (20) Core-Mathematics', '', 'Students with prior credit for MATH 2318 will not receive credit for MATH 1324. May not apply to course or GPA requirements for a major or minor in natural sciences and mathematics.', '1');

--cosc map
INSERT INTO atbl_degreesCourses (
	degreeID
	,courseID
	,dcYear
	,dcSemester
	)
VALUES
(1, 'COSC 1336', 1, 'Fall'),
(1, 'ENGL 1301', 1, 'Fall'),
(1, 'HIST 1301', 1, 'Fall'),
(1, 'GOVT 2306', 1, 'Fall'),
(1, 'MATH 2413', 1, 'Fall'),
(1, 'COSC 1437', 1, 'Spring'),
(1, 'ENGL 1302', 1, 'Spring'),
(1, 'HIST 1302', 1, 'Spring'),
(1, 'GOVT 2305', 1, 'Spring'),
(1, 'MATH 2414', 1, 'Spring'),
(1, 'COSC 2436', 2, 'Fall'),
(1, 'COSC 2425', 2, 'Fall'),
(1, 'MATH 2318', 2, 'Fall'),
(1, 'GEOL 1302', 2, 'Fall'),
(1, 'GEOL 1102', 2, 'Fall'),
(1, 'MUSI 1307', 2, 'Spring'),
(1, 'COSC 3360', 2, 'Spring'),
(1, 'COSC 3336', 2, 'Spring'),
(1, 'GEOL 1303', 2, 'Spring'),
(1, 'GEOL 1103', 2, 'Spring'),
(1, 'CHIN 3344', 2, 'Spring'),
(1, 'COSC 3340', 3, 'Fall'),
(1, 'COSC 3320', 3, 'Fall'),
(1, 'MATH 3339', 3, 'Fall'),
(1, 'ANTH 2304', 3, 'Fall'),
(1, 'BIOL 1306', 3, 'Fall'),
(1, 'COSC 3380', 3, 'Spring'),
(1, 'AAMS 2300', 3, 'Spring'),
(1, 'BIOL 1307', 3, 'Spring'),
(1, 'DIGM 1350', 3, 'Spring'),
(1, 'COSC 4351', 3, 'Spring'),
(1, 'COSC 3337', 4, 'Fall'),
(1, 'COSC 3371', 4, 'Fall'),
(1, 'DIGM 2325' ,4, 'Fall'),
(1, 'DIGM 2353', 4, 'Fall'),
(1, 'DIGM 3351', 4, 'Fall'),
(1, 'COSC 4337', 4, 'Spring'),
(1, 'COSC 4315', 4, 'Spring'),
(1, 'DIGM 3252', 4, 'Spring'),
(1, 'DIGM 3152', 4, 'Spring'),
(1, 'DIGM 4373', 4, 'Spring');

--digm map
INSERT INTO atbl_degreesCourses (
	degreeID
	,courseID
	,dcYear
	,dcSemester
	)
VALUES
(2, 'DIGM 1300', 1, 'Fall'),
(2, 'HIST 1301', 1, 'Fall'),
(2, 'ENGL 1301', 1, 'Fall'),
(2, 'MATH 1314', 1, 'Fall'),
(2, 'BIOL 1306', 1, 'Fall'),
(2, 'DIGM 1350', 1, 'Spring'),
(2, 'DIGM 1376', 1, 'Spring'),
(2, 'ENGL 1302', 1, 'Spring'),
(2, 'MATH 1324', 1, 'Spring'),
(2, 'BIOL 1307', 1, 'Spring'),
(2, 'DIGM 2353', 2, 'Fall'),
(2, 'DIGM 2357', 2, 'Fall'),
(2, 'HIST 1302', 2, 'Fall'),
(2, 'MATH 1342', 2, 'Fall'),
(2, 'GOVT 2306', 2, 'Fall'),
(2, 'DIGM 2352', 2, 'Spring'),
(2, 'CIS 3320', 2, 'Spring'),
(2, 'DIGM 2325', 2, 'Spring'),
(2, 'HDCS 1300', 2, 'Spring'),
(2, 'PHIL 1321', 2, 'Spring'),
(2, 'DIGM 3351', 3, 'Fall'),
(2, 'DIGM 3354', 3, 'Fall'),
(2, 'GOVT 2305', 3, 'Fall'),
(2, 'SOCI 1301', 3, 'Fall'),
(2, 'TLIM 3330', 3, 'Fall'),
(2, 'DIGM 3252', 3, 'Spring'),
(2, 'DIGM 3152', 3, 'Spring'),
(2, 'DIGM 3350', 3, 'Spring'),
(2, 'AAS 2320', 3, 'Spring'),
(2, 'TLIM 3331', 3, 'Spring'),
(2, 'DIGM 4372', 4, 'Fall'),
(2, 'DIGM 4351', 4, 'Fall'),
(2, 'DIGM 3355', 4, 'Fall'),
(2, 'PHIL 1361', 4, 'Fall'),
(2, 'TLIM 3340', 4, 'Fall'),
(2, 'DIGM 4378', 4, 'Spring'),
(2, 'DIGM 4379', 4, 'Spring'),
(2, 'DIGM 3356', 4, 'Spring'),
(2, 'TLIM 3345', 4, 'Spring'),
(2, 'TLIM 3346', 4, 'Spring');

--students
INSERT INTO atbl_students (
	enrollmentStatus
	,firstName
	,lastName
	,dateOfBirth
	)
VALUES
('Full Time', 'Ricky', 'Tran', '2000-07-27'),
('Part Time', 'Gabriel', 'Daniels', '2000-06-19');

--emails
INSERT INTO atbl_emails (
	studentID
	,emailType
	,email
	)
VALUES
(1, 'School', 'rtran@uh.com'),
(2, 'School', 'gDaniels@uh.com');

--studnet degrees
INSERT INTO atbl_studentsDegrees (
	studentID
	,degreeID
	,enrollmentYear
	,gradutationYear
	)
VALUES
(1,1,'Fall 2022','Sping 2026'),
(2,2,'Fall 2022', 'Spring 2028');

-- student courses
INSERT INTO atbl_studentsDegreesCourses (
	studentID
	,degreeID
	,courseID
	,scYear
	,scSemester
	,numberGrade
	,enrollmentDate
	,dropDate
)
VALUES
(1, 1, 'COSC 1336', 1, 'Fall', 95, '2022-08-22', null),
(1, 1, 'ENGL 1301', 1, 'Fall', 91, '2022-08-22', null),
(1, 1, 'HIST 1301', 1, 'Fall', 84, '2022-08-22', null),
(1, 1, 'GOVT 2306', 1, 'Fall', 69, '2022-08-22', null),
(1, 1, 'MATH 2413', 1, 'Fall', 92, '2022-08-22', null),
(2, 2, 'DIGM 1300', 1, 'Fall', 95, '2022-08-22', null),
(2, 2, 'HIST 1301', 1, 'Fall', 74, '2022-08-22', null),
(2, 2, 'ENGL 1301', 1, 'Fall', 92, '2022-08-22', null),
(1, 1, 'COSC 1437', 1, 'Spring', 95, '2023-01-02', null),
(1, 1, 'ENGL 1302', 1, 'Spring', 91, '2023-01-02', null),
(1, 1, 'HIST 1302', 1, 'Spring', 84, '2023-01-02', null),
(1, 1, 'GOVT 2306', 1, 'Spring', 81, '2023-01-02', null),
(1, 1, 'MATH 2414', 1, 'Spring', 92, '2023-01-02', null),
(1, 3, 'DIGM 2325', 2, 'Fall', 92, '2023-08-02', null),
(1, 3, 'DIGM 1350', 2, 'Fall', 85, '2023-08-02', null),
(1, 1, 'COSC 2436', 2, 'Fall', 88, '2023-08-02', null),
(1, 1, 'COSC 2425', 2, 'Fall', 91, '2023-08-02', null);

drop table atbl_studentsDegreesCourses;
drop table atbl_studentsDegrees;
drop table atbl_emails;
drop table atbl_students;
drop table atbl_degreesCourses;
drop table atbl_courses;
drop table atbl_degrees;