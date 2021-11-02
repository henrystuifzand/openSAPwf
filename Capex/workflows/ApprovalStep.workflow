{
	"contents": {
		"8c25034e-235e-4ba2-a445-436165f1006a": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "approvalstep",
			"subject": "ApprovalStep",
			"name": "ApprovalStep",
			"documentation": "ApprovalStep",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "Start Approval Step"
				},
				"692238c9-0338-4ed4-9cb7-8ab822e7aa84": {
					"name": "Terminate Approval"
				},
				"27c1c701-5e5f-457e-9927-795ecfa7f06b": {
					"name": "End Approval Step"
				}
			},
			"activities": {
				"6c38ed4b-8322-4030-948b-d8f6b44f9843": {
					"name": "Prepare Approval"
				},
				"f61e035f-588f-4ce1-ac99-378bfee753cb": {
					"name": "Get Approvers"
				},
				"0c64ab89-3967-40d9-8810-3210edbd3b61": {
					"name": "Process Approver Details"
				},
				"c4e7f8d5-5b97-461f-86fa-1822386a2f62": {
					"name": "Approval Needed?"
				},
				"afde003c-34d3-424d-91cf-5e0c6041d536": {
					"name": "Approval Task"
				},
				"d27683ac-c7a6-4e30-88d4-c2f5d5e4610b": {
					"name": "Process Approval Result"
				},
				"09ca2ba9-584f-4419-b177-8b653d339f88": {
					"name": "Approval Decision"
				},
				"6ae83c4e-5cf8-4288-aab0-3186fe25249f": {
					"name": "Rework Approval Request"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"2ce3a1dd-5171-4d1d-9225-dcc2183841af": {
					"name": "SequenceFlow2"
				},
				"0b3bb370-612b-470a-bb57-a5be1ccaa014": {
					"name": "SequenceFlow4"
				},
				"031ca690-b625-4566-b6a4-b93373ef02b0": {
					"name": "SequenceFlow5"
				},
				"28a1734d-f265-449e-af6e-a58fad275a5a": {
					"name": "Yes"
				},
				"b28bab6c-57d1-42be-9f01-9bb58748fdb8": {
					"name": "SequenceFlow7"
				},
				"39249839-a6bf-416e-b772-db78da5334cf": {
					"name": "SequenceFlow8"
				},
				"6d7c14dc-01ae-42f1-b7a5-29403d8b99fe": {
					"name": "Rejected"
				},
				"b246183d-e0c8-4aab-b703-8cc1a42c77c8": {
					"name": "SequenceFlow10"
				},
				"ec76d07c-9210-488a-b0e4-1a6c9df4d957": {
					"name": "Rework"
				},
				"fa562ea9-fc03-44d8-9aed-d4938bf011a7": {
					"name": "Accepted"
				},
				"2ba0f368-dd97-401b-8705-889c074883ef": {
					"name": "No"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "Start Approval Step",
			"sampleContextRefs": {
				"f9d645fe-897d-4ec0-a4d8-b6941fdd3962": {}
			}
		},
		"692238c9-0338-4ed4-9cb7-8ab822e7aa84": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent2",
			"name": "Terminate Approval"
		},
		"27c1c701-5e5f-457e-9927-795ecfa7f06b": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent4",
			"name": "End Approval Step"
		},
		"6c38ed4b-8322-4030-948b-d8f6b44f9843": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/ApprovalStep/PrepareApproval.js",
			"id": "scripttask1",
			"name": "Prepare Approval"
		},
		"f61e035f-588f-4ce1-ac99-378bfee753cb": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "BUSINESS_RULES",
			"path": "/rest/v2/rule-services",
			"httpMethod": "POST",
			"requestVariable": "${context.internal.rulesPayload}",
			"responseVariable": "${context.internal.ruleresult}",
			"id": "servicetask1",
			"name": "Get Approvers"
		},
		"0c64ab89-3967-40d9-8810-3210edbd3b61": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/ApprovalStep/ProcessApproverDetails.js",
			"id": "scripttask2",
			"name": "Process Approver Details"
		},
		"c4e7f8d5-5b97-461f-86fa-1822386a2f62": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "Approval Needed?",
			"default": "2ba0f368-dd97-401b-8705-889c074883ef"
		},
		"afde003c-34d3-424d-91cf-5e0c6041d536": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approval for Capital Expenditure Request \"${context.Title}\" in your role as ${context.role}",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.internal.step.approver.UserId}",
			"recipientGroups": "${context.internal.step.approver.GroupId}",
			"formReference": "/forms/ApprovalStep/ApprovalForm.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "approvalform"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "Approval Task"
		},
		"d27683ac-c7a6-4e30-88d4-c2f5d5e4610b": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/ApprovalStep/ProcessApprovalResult.js",
			"id": "scripttask3",
			"name": "Process Approval Result"
		},
		"09ca2ba9-584f-4419-b177-8b653d339f88": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway2",
			"name": "Approval Decision",
			"default": "6d7c14dc-01ae-42f1-b7a5-29403d8b99fe"
		},
		"6ae83c4e-5cf8-4288-aab0-3186fe25249f": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Rework required for CapEx Request \"${context.Title}\"",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.Requester.UserId}, ${info.startedBy}",
			"formReference": "/forms/ApprovalStep/ApprovalForm.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "approvalform"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask2",
			"name": "Rework Approval Request"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "6c38ed4b-8322-4030-948b-d8f6b44f9843"
		},
		"2ce3a1dd-5171-4d1d-9225-dcc2183841af": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "6c38ed4b-8322-4030-948b-d8f6b44f9843",
			"targetRef": "f61e035f-588f-4ce1-ac99-378bfee753cb"
		},
		"0b3bb370-612b-470a-bb57-a5be1ccaa014": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "f61e035f-588f-4ce1-ac99-378bfee753cb",
			"targetRef": "0c64ab89-3967-40d9-8810-3210edbd3b61"
		},
		"031ca690-b625-4566-b6a4-b93373ef02b0": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "SequenceFlow5",
			"sourceRef": "0c64ab89-3967-40d9-8810-3210edbd3b61",
			"targetRef": "c4e7f8d5-5b97-461f-86fa-1822386a2f62"
		},
		"28a1734d-f265-449e-af6e-a58fad275a5a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.internal.step.isRequired}",
			"id": "sequenceflow6",
			"name": "Yes",
			"sourceRef": "c4e7f8d5-5b97-461f-86fa-1822386a2f62",
			"targetRef": "afde003c-34d3-424d-91cf-5e0c6041d536"
		},
		"b28bab6c-57d1-42be-9f01-9bb58748fdb8": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow7",
			"name": "SequenceFlow7",
			"sourceRef": "afde003c-34d3-424d-91cf-5e0c6041d536",
			"targetRef": "d27683ac-c7a6-4e30-88d4-c2f5d5e4610b"
		},
		"39249839-a6bf-416e-b772-db78da5334cf": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow8",
			"name": "SequenceFlow8",
			"sourceRef": "d27683ac-c7a6-4e30-88d4-c2f5d5e4610b",
			"targetRef": "09ca2ba9-584f-4419-b177-8b653d339f88"
		},
		"6d7c14dc-01ae-42f1-b7a5-29403d8b99fe": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow9",
			"name": "Rejected",
			"sourceRef": "09ca2ba9-584f-4419-b177-8b653d339f88",
			"targetRef": "692238c9-0338-4ed4-9cb7-8ab822e7aa84"
		},
		"b246183d-e0c8-4aab-b703-8cc1a42c77c8": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow10",
			"name": "SequenceFlow10",
			"sourceRef": "6ae83c4e-5cf8-4288-aab0-3186fe25249f",
			"targetRef": "6c38ed4b-8322-4030-948b-d8f6b44f9843"
		},
		"ec76d07c-9210-488a-b0e4-1a6c9df4d957": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision == \"rework\"}",
			"id": "sequenceflow11",
			"name": "Rework",
			"sourceRef": "09ca2ba9-584f-4419-b177-8b653d339f88",
			"targetRef": "6ae83c4e-5cf8-4288-aab0-3186fe25249f"
		},
		"fa562ea9-fc03-44d8-9aed-d4938bf011a7": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision == \"approve\"}",
			"id": "sequenceflow12",
			"name": "Accepted",
			"sourceRef": "09ca2ba9-584f-4419-b177-8b653d339f88",
			"targetRef": "27c1c701-5e5f-457e-9927-795ecfa7f06b"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"9c6709d5-7e6a-43be-84d5-b7736b6550aa": {},
				"ee94efe4-5c22-494e-9953-6d78b3ec9bc0": {},
				"ad3463d7-7dbc-4d11-a716-934b81fe1730": {},
				"55c9db85-4831-4fcd-bc3b-5fefe348976a": {},
				"97b6dde6-256a-463d-ba79-30c4da6a7a64": {},
				"cfe6e5b4-ff00-4d0e-bc17-1a6f8fd5fd6e": {},
				"02db3778-bdee-4d75-8bf5-6d3be646bb50": {},
				"067aacfb-4e7f-4f18-9bde-557cb80c9e79": {},
				"0af39e71-48a8-4c2d-bc55-6eccd4041939": {},
				"59b5aa35-19b8-4bc6-bb60-e72662375b40": {},
				"b2828921-f565-4523-a802-cfa61845b605": {},
				"f649beee-a8fb-4815-bdda-b7738378e284": {},
				"be889af1-e5c3-4008-8d4e-0cfe4f1f58f1": {},
				"60fc3005-fc24-49ba-990e-edcb0d9fd57b": {},
				"d3a54bc2-bae1-4d39-a619-2d93bf5e3857": {},
				"ac753fc7-ef18-459d-951b-0a5b52402382": {},
				"730bd340-f5d6-4b15-90c7-770e54e51766": {},
				"92ad2be8-d049-438f-b739-793b403d932f": {},
				"ae7672e5-a7d3-49e2-a278-768faf06bd6d": {},
				"b3553025-1cb0-48cc-af90-8f6946304256": {},
				"51a417de-aa09-412f-b0c0-025d8f793149": {}
			}
		},
		"f9d645fe-897d-4ec0-a4d8-b6941fdd3962": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/ApprovalStep/CapexSampleStartPayload.json",
			"id": "default-start-context"
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 12,
			"y": 26,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "44,42 94,42",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "9c6709d5-7e6a-43be-84d5-b7736b6550aa",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"9c6709d5-7e6a-43be-84d5-b7736b6550aa": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 94,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "6c38ed4b-8322-4030-948b-d8f6b44f9843"
		},
		"ee94efe4-5c22-494e-9953-6d78b3ec9bc0": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "194,42 244,42",
			"sourceSymbol": "9c6709d5-7e6a-43be-84d5-b7736b6550aa",
			"targetSymbol": "ad3463d7-7dbc-4d11-a716-934b81fe1730",
			"object": "2ce3a1dd-5171-4d1d-9225-dcc2183841af"
		},
		"ad3463d7-7dbc-4d11-a716-934b81fe1730": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 244,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "f61e035f-588f-4ce1-ac99-378bfee753cb"
		},
		"55c9db85-4831-4fcd-bc3b-5fefe348976a": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 394,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "0c64ab89-3967-40d9-8810-3210edbd3b61"
		},
		"97b6dde6-256a-463d-ba79-30c4da6a7a64": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "344,42 394,42",
			"sourceSymbol": "ad3463d7-7dbc-4d11-a716-934b81fe1730",
			"targetSymbol": "55c9db85-4831-4fcd-bc3b-5fefe348976a",
			"object": "0b3bb370-612b-470a-bb57-a5be1ccaa014"
		},
		"cfe6e5b4-ff00-4d0e-bc17-1a6f8fd5fd6e": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 543,
			"y": 21,
			"object": "c4e7f8d5-5b97-461f-86fa-1822386a2f62"
		},
		"02db3778-bdee-4d75-8bf5-6d3be646bb50": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "494,42 543,42",
			"sourceSymbol": "55c9db85-4831-4fcd-bc3b-5fefe348976a",
			"targetSymbol": "cfe6e5b4-ff00-4d0e-bc17-1a6f8fd5fd6e",
			"object": "031ca690-b625-4566-b6a4-b93373ef02b0"
		},
		"067aacfb-4e7f-4f18-9bde-557cb80c9e79": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 636,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "afde003c-34d3-424d-91cf-5e0c6041d536"
		},
		"0af39e71-48a8-4c2d-bc55-6eccd4041939": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "585,42 636,42",
			"sourceSymbol": "cfe6e5b4-ff00-4d0e-bc17-1a6f8fd5fd6e",
			"targetSymbol": "067aacfb-4e7f-4f18-9bde-557cb80c9e79",
			"object": "28a1734d-f265-449e-af6e-a58fad275a5a"
		},
		"59b5aa35-19b8-4bc6-bb60-e72662375b40": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 786,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "d27683ac-c7a6-4e30-88d4-c2f5d5e4610b"
		},
		"b2828921-f565-4523-a802-cfa61845b605": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "736,42 786,42",
			"sourceSymbol": "067aacfb-4e7f-4f18-9bde-557cb80c9e79",
			"targetSymbol": "59b5aa35-19b8-4bc6-bb60-e72662375b40",
			"object": "b28bab6c-57d1-42be-9f01-9bb58748fdb8"
		},
		"f649beee-a8fb-4815-bdda-b7738378e284": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 940,
			"y": 21,
			"object": "09ca2ba9-584f-4419-b177-8b653d339f88"
		},
		"be889af1-e5c3-4008-8d4e-0cfe4f1f58f1": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "886,42 940,42",
			"sourceSymbol": "59b5aa35-19b8-4bc6-bb60-e72662375b40",
			"targetSymbol": "f649beee-a8fb-4815-bdda-b7738378e284",
			"object": "39249839-a6bf-416e-b772-db78da5334cf"
		},
		"60fc3005-fc24-49ba-990e-edcb0d9fd57b": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 1028,
			"y": 24.5,
			"width": 35,
			"height": 35,
			"object": "692238c9-0338-4ed4-9cb7-8ab822e7aa84"
		},
		"d3a54bc2-bae1-4d39-a619-2d93bf5e3857": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "982,42 1028,42",
			"sourceSymbol": "f649beee-a8fb-4815-bdda-b7738378e284",
			"targetSymbol": "60fc3005-fc24-49ba-990e-edcb0d9fd57b",
			"object": "6d7c14dc-01ae-42f1-b7a5-29403d8b99fe"
		},
		"ac753fc7-ef18-459d-951b-0a5b52402382": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 84,
			"y": -187,
			"width": 100,
			"height": 60,
			"object": "6ae83c4e-5cf8-4288-aab0-3186fe25249f"
		},
		"730bd340-f5d6-4b15-90c7-770e54e51766": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "155,-161 155,42",
			"sourceSymbol": "ac753fc7-ef18-459d-951b-0a5b52402382",
			"targetSymbol": "9c6709d5-7e6a-43be-84d5-b7736b6550aa",
			"object": "b246183d-e0c8-4aab-b703-8cc1a42c77c8"
		},
		"92ad2be8-d049-438f-b739-793b403d932f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "961,21.5 961,-157 183.5,-157",
			"sourceSymbol": "f649beee-a8fb-4815-bdda-b7738378e284",
			"targetSymbol": "ac753fc7-ef18-459d-951b-0a5b52402382",
			"object": "ec76d07c-9210-488a-b0e4-1a6c9df4d957"
		},
		"ae7672e5-a7d3-49e2-a278-768faf06bd6d": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 943,
			"y": 173.5,
			"width": 35,
			"height": 35,
			"object": "27c1c701-5e5f-457e-9927-795ecfa7f06b"
		},
		"b3553025-1cb0-48cc-af90-8f6946304256": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "960.75,42 960.75,191",
			"sourceSymbol": "f649beee-a8fb-4815-bdda-b7738378e284",
			"targetSymbol": "ae7672e5-a7d3-49e2-a278-768faf06bd6d",
			"object": "fa562ea9-fc03-44d8-9aed-d4938bf011a7"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"terminateeventdefinition": 2,
			"sequenceflow": 14,
			"startevent": 1,
			"endevent": 5,
			"usertask": 2,
			"servicetask": 1,
			"scripttask": 3,
			"exclusivegateway": 2
		},
		"2ba0f368-dd97-401b-8705-889c074883ef": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow14",
			"name": "No",
			"sourceRef": "c4e7f8d5-5b97-461f-86fa-1822386a2f62",
			"targetRef": "27c1c701-5e5f-457e-9927-795ecfa7f06b"
		},
		"51a417de-aa09-412f-b0c0-025d8f793149": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "561,42 561,224 955,224 955,183",
			"sourceSymbol": "cfe6e5b4-ff00-4d0e-bc17-1a6f8fd5fd6e",
			"targetSymbol": "ae7672e5-a7d3-49e2-a278-768faf06bd6d",
			"object": "2ba0f368-dd97-401b-8705-889c074883ef"
		}
	}
}