//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSTranscribeResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSTranscribeResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSTranscribeResources

+ (instancetype)sharedInstance {
    static AWSTranscribeResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSTranscribeResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2017-10-26\",\
    \"endpointPrefix\":\"transcribe\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Transcribe Service\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"transcribe\",\
    \"targetPrefix\":\"Transcribe\",\
    \"uid\":\"transcribe-2017-10-26\"\
  },\
  \"operations\":{\
    \"CreateVocabulary\":{\
      \"name\":\"CreateVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateVocabularyRequest\"},\
      \"output\":{\"shape\":\"CreateVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a new custom vocabulary that you can use to change the way Amazon Transcribe handles transcription of an audio file.</p>\"\
    },\
    \"DeleteVocabulary\":{\
      \"name\":\"DeleteVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteVocabularyRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a vocabulary from Amazon Transcribe. </p>\"\
    },\
    \"GetTranscriptionJob\":{\
      \"name\":\"GetTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetTranscriptionJobRequest\"},\
      \"output\":{\"shape\":\"GetTranscriptionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a transcription job. To see the status of the job, check the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished and you can find the results at the location specified in the <code>TranscriptionFileUri</code> field.</p>\"\
    },\
    \"GetVocabulary\":{\
      \"name\":\"GetVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetVocabularyRequest\"},\
      \"output\":{\"shape\":\"GetVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Gets information about a vocabulary.</p>\"\
    },\
    \"ListTranscriptionJobs\":{\
      \"name\":\"ListTranscriptionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTranscriptionJobsRequest\"},\
      \"output\":{\"shape\":\"ListTranscriptionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists transcription jobs with the specified status.</p>\"\
    },\
    \"ListVocabularies\":{\
      \"name\":\"ListVocabularies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListVocabulariesRequest\"},\
      \"output\":{\"shape\":\"ListVocabulariesResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of vocabularies that match the specified criteria. If no criteria are specified, returns the entire list of vocabularies.</p>\"\
    },\
    \"StartTranscriptionJob\":{\
      \"name\":\"StartTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartTranscriptionJobRequest\"},\
      \"output\":{\"shape\":\"StartTranscriptionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous job to transcribe speech to text.</p>\"\
    },\
    \"UpdateVocabulary\":{\
      \"name\":\"UpdateVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateVocabularyRequest\"},\
      \"output\":{\"shape\":\"UpdateVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Updates an existing vocabulary with new values.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"BadRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"FailureReason\"}\
      },\
      \"documentation\":\"<p>Your request didn't pass one or more validation tests. For example, a name already exists when createing a resource or a name may not exist when getting a transcription job or custom vocabulary. See the exception <code>Message</code> field for more information.</p>\",\
      \"exception\":true\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The <code>JobName</code> field is a duplicate of a previously entered job name. Resend your request with a different name.</p>\",\
      \"exception\":true\
    },\
    \"CreateVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyName\",\
        \"LanguageCode\",\
        \"Phrases\"\
      ],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary. The name must be unique within an AWS account. The name is case-sensitive.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"Phrases\":{\
          \"shape\":\"Phrases\",\
          \"documentation\":\"<p>An array of strings that contains the vocabulary entries. </p>\"\
        }\
      }\
    },\
    \"CreateVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary. When the <code>VocabularyState</code> field contains <code>READY</code> the vocabulary is ready to be used in a <code>StartTranscriptionJob</code> request.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was created.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>VocabularyState</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p>\"\
        }\
      }\
    },\
    \"DateTime\":{\"type\":\"timestamp\"},\
    \"DeleteVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyName\"],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to delete. </p>\"\
        }\
      }\
    },\
    \"FailureReason\":{\"type\":\"string\"},\
    \"GetTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TranscriptionJobName\"],\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the job.</p>\"\
        }\
      }\
    },\
    \"GetTranscriptionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJob\":{\
          \"shape\":\"TranscriptionJob\",\
          \"documentation\":\"<p>An object that contains the results of the transcription job.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyName\"],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to return information about. The name is case-sensitive.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to return.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was last modified.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>VocabularyState</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p>\"\
        },\
        \"DownloadUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location where the vocabulary is stored. Use this URI to get the contents of the vocabulary. The URI is available for a limited time.</p>\"\
        }\
      }\
    },\
    \"InternalFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>There was an internal error. Check the error message and try your request again.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"LanguageCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"en-US\",\
        \"es-US\"\
      ]\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Either you have sent too many requests or your input file is too long. Wait before you resend your request, or use a smaller file and resend the request.</p>\",\
      \"exception\":true\
    },\
    \"ListTranscriptionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>When specified, returns only transcription jobs with the specified status.</p>\"\
        },\
        \"JobNameContains\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>When specified, the jobs returned in the list are limited to jobs whose name contains the specified string.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous request to <code>ListTranscriptionJobs</code> was truncated, include the <code>NextToken</code> to fetch the next set of jobs.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of jobs to return in the response. If there are fewer results in the list, this response contains only the actual results.</p>\"\
        }\
      }\
    },\
    \"ListTranscriptionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The requested status of the jobs returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>ListTranscriptionJobs</code> operation returns a page of jobs at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If there are more jobs in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the <code>ListTranscriptionJobs</code> operation to return in the next page of jobs.</p>\"\
        },\
        \"TranscriptionJobSummaries\":{\
          \"shape\":\"TranscriptionJobSummaries\",\
          \"documentation\":\"<p>A list of objects containing summary information for a transcription job.</p>\"\
        }\
      }\
    },\
    \"ListVocabulariesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous request to <code>ListVocabularies</code> was truncated, include the <code>NextToken</code> to fetch the next set of jobs.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of vocabularies to return in the response. If there are fewer results in the list, this response contains only the actual results.</p>\"\
        },\
        \"StateEquals\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>When specified, only returns vocabularies with the <code>VocabularyState</code> field equal to the specified state.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>When specified, the vocabularies returned in the list are limited to vocabularies whose name contains the specified string. The search is case-insensitive, <code>ListVocabularies</code> will return both \\\"vocabularyname\\\" and \\\"VocabularyName\\\" in the response list.</p>\"\
        }\
      }\
    },\
    \"ListVocabulariesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The requested vocabulary state.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>ListVocabularies</code> operation returns a page of vocabularies at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If there are more jobs in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the <code>ListVocabularies</code> operation to return in the next page of jobs.</p>\"\
        },\
        \"Vocabularies\":{\
          \"shape\":\"Vocabularies\",\
          \"documentation\":\"<p>A list of objects that describe the vocabularies that match the search criteria in the request.</p>\"\
        }\
      }\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"MaxSpeakers\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":2\
    },\
    \"Media\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MediaFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location of the input media file. The URI must be in the same region as the API endpoint that you are calling. The general form is:</p> <p> <code> https://&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt; </code> </p> <p>For example:</p> <p> <code>https://s3-us-east-1.amazonaws.com/examplebucket/example.mp4</code> </p> <p> <code>https://s3-us-east-1.amazonaws.com/examplebucket/mediadocs/example.mp4</code> </p> <p>For more information about S3 object names, see <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys\\\">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the input media file in a transcription request.</p>\"\
    },\
    \"MediaFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"mp3\",\
        \"mp4\",\
        \"wav\",\
        \"flac\"\
      ]\
    },\
    \"MediaSampleRateHertz\":{\
      \"type\":\"integer\",\
      \"max\":48000,\
      \"min\":8000\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"max\":8192\
    },\
    \"NotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>We can't find the requested transcription job or custom vocabulary. Check the name and try your request again.</p>\",\
      \"exception\":true\
    },\
    \"Phrase\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"Phrases\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Phrase\"}\
    },\
    \"Settings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of a vocabulary to use when processing the transcription job.</p>\"\
        },\
        \"ShowSpeakerLabels\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Determines whether the transcription job should use speaker recognition to identify different speakers in the input audio. If you set the <code>ShowSpeakerLabels</code> field to true, you must also set the maximum number of speaker labels <code>MaxSpeakerLabels</code> field.</p>\"\
        },\
        \"MaxSpeakerLabels\":{\
          \"shape\":\"MaxSpeakers\",\
          \"documentation\":\"<p>The maximum number of speakers to identify in the input audio. If there are more speakers in the audio than this number, multiple speakers will be identified as a single speaker. If you specify the <code>MaxSpeakerLabels</code> field, you must set the <code>ShowSpeakerLabels</code> field to true.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides optional settings for the <code>StartTranscriptionJob</code> operation.</p>\"\
    },\
    \"StartTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TranscriptionJobName\",\
        \"LanguageCode\",\
        \"MediaFormat\",\
        \"Media\"\
      ],\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the job. The name must be unique within an AWS account.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the language used in the input media file.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in Hertz, of the audio track in the input media file. </p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>The format of the input media file.</p>\"\
        },\
        \"Media\":{\
          \"shape\":\"Media\",\
          \"documentation\":\"<p>An object that describes the input media for a transcription job.</p>\"\
        },\
        \"Settings\":{\
          \"shape\":\"Settings\",\
          \"documentation\":\"<p>A <code>Settings</code> object that provides optional settings for a transcription job.</p>\"\
        }\
      }\
    },\
    \"StartTranscriptionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJob\":{\
          \"shape\":\"TranscriptionJob\",\
          \"documentation\":\"<p>An object containing details of the asynchronous transcription job.</p>\"\
        }\
      }\
    },\
    \"String\":{\"type\":\"string\"},\
    \"Transcript\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location where the transcription result is stored. Use this URI to access the results of the transcription job. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the output of a transcription job.</p>\"\
    },\
    \"TranscriptionJob\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>A name to identify the transcription job.</p>\"\
        },\
        \"TranscriptionJobStatus\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The status of the transcription job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the input speech.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in Hertz, of the audio track in the input media file. </p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>The format of the input media file.</p>\"\
        },\
        \"Media\":{\
          \"shape\":\"Media\",\
          \"documentation\":\"<p>An object that describes the input media for a transcription job.</p>\"\
        },\
        \"Transcript\":{\
          \"shape\":\"Transcript\",\
          \"documentation\":\"<p>An object that describes the output of the transcription job.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>Timestamp of the date and time that the job was created.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>Timestamp of the date and time that the job completed.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p>\"\
        },\
        \"Settings\":{\
          \"shape\":\"Settings\",\
          \"documentation\":\"<p>Optional settings for the transcription job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an asynchronous transcription job that was created with the <code>StartTranscriptionJob</code> operation.</p>\"\
    },\
    \"TranscriptionJobName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"TranscriptionJobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN_PROGRESS\",\
        \"FAILED\",\
        \"COMPLETED\"\
      ]\
    },\
    \"TranscriptionJobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TranscriptionJobSummary\"}\
    },\
    \"TranscriptionJobSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name assigned to the transcription job when it was created.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>Timestamp of the date and time that the job was created.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>Timestamp of the date and time that the job completed.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the input speech.</p>\"\
        },\
        \"TranscriptionJobStatus\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The status of the transcription job. When the status is <code>COMPLETED</code>, use the <code>GetTranscriptionJob</code> operation to get the results of the transcription.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, this field contains a description of the error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides a summary of information about a transcription job.</p>\"\
    },\
    \"UpdateVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyName\",\
        \"LanguageCode\",\
        \"Phrases\"\
      ],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to update. The name is case-sensitive.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"Phrases\":{\
          \"shape\":\"Phrases\",\
          \"documentation\":\"<p>An array of strings containing the vocabulary entries.</p>\"\
        }\
      }\
    },\
    \"UpdateVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary that was updated.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was updated.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary. When the <code>VocabularyState</code> field contains <code>READY</code> the vocabulary is ready to be used in a <code>StartTranscriptionJob</code> request.</p>\"\
        }\
      }\
    },\
    \"Uri\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1\
    },\
    \"Vocabularies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VocabularyInfo\"}\
    },\
    \"VocabularyInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was last modified.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary. If the state is <code>READY</code> you can use the vocabulary in a <code>StartTranscriptionJob</code> request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a custom vocabulary.</p>\"\
    },\
    \"VocabularyName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"VocabularyState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"READY\",\
        \"FAILED\"\
      ]\
    }\
  },\
  \"documentation\":\"<p>Operations and objects for transcribing speech to text.</p>\"\
}";
}

@end
