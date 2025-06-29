{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.3.0",
        "fileVersion": "1.1",
        "template": false,
        "nodesVersions": {
            "FeatureExtraction": "1.3",
            "CameraInit": "9.0",
            "DepthMapFilter": "4.0",
            "ImageMatching": "2.0",
            "MeshFiltering": "3.0",
            "StructureFromMotion": "3.3",
            "Texturing": "6.0",
            "FeatureMatching": "2.0",
            "PrepareDenseScene": "3.1",
            "Meshing": "7.0",
            "DepthMap": "5.0"
        }
    },
    "graph": {
        "Texturing_1": {
            "nodeType": "Texturing",
            "position": [
                2000,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "0faab5a660341962d55d83c3ee81a484f7b5893b"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{Meshing_1.output}",
                "imagesFolder": "{DepthMap_1.imagesFolder}",
                "inputMesh": "{MeshFiltering_1.outputMesh}",
                "inputRefMesh": "",
                "textureSide": 8192,
                "downscale": 2,
                "outputMeshFileType": "obj",
                "colorMapping": {
                    "enable": true,
                    "colorMappingFileType": "exr"
                },
                "bumpMapping": {
                    "enable": true,
                    "bumpType": "Normal",
                    "normalFileType": "exr",
                    "heightFileType": "exr"
                },
                "displacementMapping": {
                    "enable": true,
                    "displacementMappingFileType": "exr"
                },
                "unwrapMethod": "Basic",
                "useUDIM": true,
                "fillHoles": false,
                "padding": 5,
                "multiBandDownscale": 4,
                "multiBandNbContrib": {
                    "high": 1,
                    "midHigh": 5,
                    "midLow": 10,
                    "low": 0
                },
                "useScore": true,
                "bestScoreThreshold": 0.1,
                "angleHardThreshold": 90.0,
                "workingColorSpace": "sRGB",
                "outputColorSpace": "AUTO",
                "correctEV": true,
                "forceVisibleByAllVertices": false,
                "flipNormals": false,
                "visibilityRemappingMethod": "PullPush",
                "subdivisionTargetRatio": 0.8,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "outputMesh": "{cache}/{nodeType}/{uid0}/texturedMesh.{outputMeshFileTypeValue}",
                "outputMaterial": "{cache}/{nodeType}/{uid0}/texturedMesh.mtl",
                "outputTextures": "{cache}/{nodeType}/{uid0}/texture_*.exr"
            }
        },
        "Meshing_1": {
            "nodeType": "Meshing",
            "position": [
                1600,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "b6681d88a9833a5b27a7384ef4868162065eb9e2"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{DepthMapFilter_1.input}",
                "depthMapsFolder": "{DepthMapFilter_1.output}",
                "outputMeshFileType": "obj",
                "useBoundingBox": false,
                "boundingBox": {
                    "bboxTranslation": {
                        "x": 0.0,
                        "y": 0.0,
                        "z": 0.0
                    },
                    "bboxRotation": {
                        "x": 0.0,
                        "y": 0.0,
                        "z": 0.0
                    },
                    "bboxScale": {
                        "x": 1.0,
                        "y": 1.0,
                        "z": 1.0
                    }
                },
                "estimateSpaceFromSfM": true,
                "estimateSpaceMinObservations": 3,
                "estimateSpaceMinObservationAngle": 10.0,
                "maxInputPoints": 50000000,
                "maxPoints": 5000000,
                "maxPointsPerVoxel": 1000000,
                "minStep": 2,
                "partitioning": "singleBlock",
                "repartition": "multiResolution",
                "angleFactor": 15.0,
                "simFactor": 15.0,
                "minVis": 2,
                "pixSizeMarginInitCoef": 2.0,
                "pixSizeMarginFinalCoef": 4.0,
                "voteMarginFactor": 4.0,
                "contributeMarginFactor": 2.0,
                "simGaussianSizeInit": 10.0,
                "simGaussianSize": 10.0,
                "minAngleThreshold": 1.0,
                "refineFuse": true,
                "helperPointsGridSize": 10,
                "densify": false,
                "densifyNbFront": 1,
                "densifyNbBack": 1,
                "densifyScale": 20.0,
                "nPixelSizeBehind": 4.0,
                "fullWeight": 1.0,
                "voteFilteringForWeaklySupportedSurfaces": true,
                "addLandmarksToTheDensePointCloud": false,
                "invertTetrahedronBasedOnNeighborsNbIterations": 10,
                "minSolidAngleRatio": 0.2,
                "nbSolidAngleFilteringIterations": 2,
                "colorizeOutput": false,
                "addMaskHelperPoints": false,
                "maskHelperPointsWeight": 1.0,
                "maskBorderSize": 4,
                "maxNbConnectedHelperPoints": 50,
                "saveRawDensePointCloud": false,
                "exportDebugTetrahedralization": false,
                "seed": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "outputMesh": "{cache}/{nodeType}/{uid0}/mesh.{outputMeshFileTypeValue}",
                "output": "{cache}/{nodeType}/{uid0}/densePointCloud.abc"
            }
        },
        "DepthMapFilter_1": {
            "nodeType": "DepthMapFilter",
            "position": [
                1400,
                0
            ],
            "parallelization": {
                "blockSize": 24,
                "size": 115,
                "split": 5
            },
            "uids": {
                "0": "585b85c8f9648438d0c979e7cb4b69c14e302296"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{DepthMap_1.input}",
                "depthMapsFolder": "{DepthMap_1.output}",
                "minViewAngle": 2.0,
                "maxViewAngle": 70.0,
                "nNearestCams": 10,
                "minNumOfConsistentCams": 3,
                "minNumOfConsistentCamsWithLowSimilarity": 4,
                "pixToleranceFactor": 2.0,
                "pixSizeBall": 0,
                "pixSizeBallWithLowSimilarity": 0,
                "computeNormalMaps": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "depth": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap.exr",
                "sim": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_simMap.exr"
            }
        },
        "ImageMatching_1": {
            "nodeType": "ImageMatching",
            "position": [
                400,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 115,
                "split": 1
            },
            "uids": {
                "0": "acb9f43d17222b54875dd365b974e339404033c4"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{FeatureExtraction_1.input}",
                "featuresFolders": [
                    "{FeatureExtraction_1.output}"
                ],
                "method": "SequentialAndVocabularyTree",
                "tree": "${ALICEVISION_VOCTREE}",
                "weights": "",
                "minNbImages": 200,
                "maxDescriptors": 500,
                "nbMatches": 40,
                "nbNeighbors": 5,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/imageMatches.txt"
            }
        },
        "FeatureExtraction_1": {
            "nodeType": "FeatureExtraction",
            "position": [
                200,
                0
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 115,
                "split": 3
            },
            "uids": {
                "0": "51ff24793fc0ffad8764f49b2149d3e16c6fe3bf"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{CameraInit_1.output}",
                "masksFolder": "",
                "maskExtension": "png",
                "maskInvert": false,
                "describerTypes": [
                    "dspsift"
                ],
                "describerPreset": "normal",
                "maxNbFeatures": 0,
                "describerQuality": "normal",
                "contrastFiltering": "GridSort",
                "relativePeakThreshold": 0.01,
                "gridFiltering": true,
                "workingColorSpace": "sRGB",
                "forceCpuExtraction": true,
                "maxThreads": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "StructureFromMotion_1": {
            "nodeType": "StructureFromMotion",
            "position": [
                800,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 115,
                "split": 1
            },
            "uids": {
                "0": "5f1230bcf7854a5315e07c16cd59c71ef9602882"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{FeatureMatching_1.input}",
                "featuresFolders": "{FeatureMatching_1.featuresFolders}",
                "matchesFolders": [
                    "{FeatureMatching_1.output}"
                ],
                "describerTypes": "{FeatureMatching_1.describerTypes}",
                "localizerEstimator": "acransac",
                "observationConstraint": "Scale",
                "localizerEstimatorMaxIterations": 4096,
                "localizerEstimatorError": 0.0,
                "lockScenePreviouslyReconstructed": false,
                "useLocalBA": true,
                "localBAGraphDistance": 1,
                "nbFirstUnstableCameras": 30,
                "maxImagesPerGroup": 30,
                "bundleAdjustmentMaxOutliers": 50,
                "maxNumberOfMatches": 0,
                "minNumberOfMatches": 0,
                "minInputTrackLength": 2,
                "minNumberOfObservationsForTriangulation": 2,
                "minAngleForTriangulation": 3.0,
                "minAngleForLandmark": 2.0,
                "maxReprojectionError": 4.0,
                "minAngleInitialPair": 5.0,
                "maxAngleInitialPair": 40.0,
                "useOnlyMatchesFromInputFolder": false,
                "useRigConstraint": true,
                "rigMinNbCamerasForCalibration": 20,
                "lockAllIntrinsics": false,
                "minNbCamerasToRefinePrincipalPoint": 3,
                "filterTrackForks": false,
                "computeStructureColor": true,
                "useAutoTransform": true,
                "initialPairA": "",
                "initialPairB": "",
                "interFileExtension": ".abc",
                "logIntermediateSteps": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/sfm.abc",
                "outputViewsAndPoses": "{cache}/{nodeType}/{uid0}/cameras.sfm",
                "extraInfoFolder": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "PrepareDenseScene_1": {
            "nodeType": "PrepareDenseScene",
            "position": [
                1000,
                0
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 115,
                "split": 3
            },
            "uids": {
                "0": "4f84c48f0345788bad755e01d17d58d89a394387"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{StructureFromMotion_1.output}",
                "imagesFolders": [],
                "masksFolders": [],
                "maskExtension": "png",
                "outputFileType": "exr",
                "saveMetadata": true,
                "saveMatricesTxtFiles": false,
                "evCorrection": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "undistorted": "{cache}/{nodeType}/{uid0}/<VIEW_ID>.{outputFileTypeValue}"
            }
        },
        "CameraInit_1": {
            "nodeType": "CameraInit",
            "position": [
                0,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 115,
                "split": 1
            },
            "uids": {
                "0": "04ce7faa3a80dce57438a2694ad30909184eabca"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 13944284,
                        "poseId": 13944284,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0272.JPG",
                        "intrinsicId": 2738572050,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:42\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:42\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:42\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"52\", \"Exif:FocalLengthIn35mmFilm\": \"78\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 43522040,
                        "poseId": 43522040,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0288.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:01\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:01\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:01\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 99502796,
                        "poseId": 99502796,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0318.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:57\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:57\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:57\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 124744820,
                        "poseId": 124744820,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0254.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:13:46\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:13:46\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:13:46\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"6400\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 125830482,
                        "poseId": 125830482,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0334.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:16:25\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:16:25\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:16:25\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 174482398,
                        "poseId": 174482398,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0325.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:16:06\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:16:06\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:16:06\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"1800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 199770960,
                        "poseId": 199770960,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0276.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:47\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:47\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:47\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 204126602,
                        "poseId": 204126602,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0267.JPG",
                        "intrinsicId": 2738572050,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:34\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:34\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:34\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"52\", \"Exif:FocalLengthIn35mmFilm\": \"78\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"1800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 212716666,
                        "poseId": 212716666,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0238_1.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:12:55\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:12:55\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:12:55\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 214247017,
                        "poseId": 214247017,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0293.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:12\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:12\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:12\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 237724374,
                        "poseId": 237724374,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0326.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:16:06\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:16:06\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:16:06\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"1800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 252559993,
                        "poseId": 252559993,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0279.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:51\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:51\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:51\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 262001091,
                        "poseId": 262001091,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0237_1.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:12:51\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:12:51\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:12:51\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 266634705,
                        "poseId": 266634705,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0235_1.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:12:44\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:12:44\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:12:44\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 283740803,
                        "poseId": 283740803,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0286.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:00\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:00\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:00\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 283899708,
                        "poseId": 283899708,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0212_1.JPG",
                        "intrinsicId": 697564746,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:11:09\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:11:09\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:11:09\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"50\", \"Exif:FocalLengthIn35mmFilm\": \"75\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 292368251,
                        "poseId": 292368251,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0210_1.JPG",
                        "intrinsicId": 1659052004,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:11:00\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:11:00\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:11:00\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"48\", \"Exif:FocalLengthIn35mmFilm\": \"72\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.8\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.3\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 293401708,
                        "poseId": 293401708,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0253.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:13:43\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:13:43\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:13:43\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"5000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 308587392,
                        "poseId": 308587392,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0211_1.JPG",
                        "intrinsicId": 1659052004,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:11:05\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:11:05\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:11:05\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"48\", \"Exif:FocalLengthIn35mmFilm\": \"72\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.9\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.3\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 348090093,
                        "poseId": 348090093,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0250.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:13:36\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:13:36\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:13:36\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 421659029,
                        "poseId": 421659029,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0256.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:08\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:08\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:08\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 442145641,
                        "poseId": 442145641,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0321.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:59\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:59\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:59\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 446837137,
                        "poseId": 446837137,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0271.JPG",
                        "intrinsicId": 2738572050,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:42\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:42\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:42\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"52\", \"Exif:FocalLengthIn35mmFilm\": \"78\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 454271577,
                        "poseId": 454271577,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0231_1.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:12:30\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:12:30\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:12:30\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 464745450,
                        "poseId": 464745450,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0319.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:58\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:58\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:58\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 485047616,
                        "poseId": 485047616,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0252.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:13:41\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:13:41\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:13:41\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 491244425,
                        "poseId": 491244425,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0284.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:58\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:58\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:58\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 509841497,
                        "poseId": 509841497,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0262.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:15\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:15\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:15\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 513049275,
                        "poseId": 513049275,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0306.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:41\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:41\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:41\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 596453227,
                        "poseId": 596453227,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0314.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:53\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:53\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:53\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 625385723,
                        "poseId": 625385723,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0216_1.JPG",
                        "intrinsicId": 697564746,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:11:33\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:11:33\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:11:33\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"50\", \"Exif:FocalLengthIn35mmFilm\": \"75\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 634886079,
                        "poseId": 634886079,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0263.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:16\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:16\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:16\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 652591538,
                        "poseId": 652591538,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0261.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:15\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:15\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:15\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 666716198,
                        "poseId": 666716198,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0292.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:12\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:12\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:12\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 671701931,
                        "poseId": 671701931,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0221_1.JPG",
                        "intrinsicId": 697564746,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:11:50\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:11:50\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:11:50\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"50\", \"Exif:FocalLengthIn35mmFilm\": \"75\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 678071659,
                        "poseId": 678071659,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0302.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:39\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:39\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:39\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 679292102,
                        "poseId": 679292102,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0316.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:56\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:56\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:56\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 704020457,
                        "poseId": 704020457,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0301.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:38\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:38\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:38\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 728329200,
                        "poseId": 728329200,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0226_1.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:12:13\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:12:13\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:12:13\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"5000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 778352991,
                        "poseId": 778352991,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0311.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:44\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:44\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:44\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 807934310,
                        "poseId": 807934310,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0215_1.JPG",
                        "intrinsicId": 697564746,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:11:27\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:11:27\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:11:27\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"50\", \"Exif:FocalLengthIn35mmFilm\": \"75\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 868885788,
                        "poseId": 868885788,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0225_1.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:12:09\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:12:09\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:12:09\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 899228399,
                        "poseId": 899228399,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0297.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:22\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:22\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:22\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 906641069,
                        "poseId": 906641069,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0220_1.JPG",
                        "intrinsicId": 697564746,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:11:46\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:11:46\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:11:46\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"50\", \"Exif:FocalLengthIn35mmFilm\": \"75\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 910795128,
                        "poseId": 910795128,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0228_1.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:12:19\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:12:19\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:12:19\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 917723885,
                        "poseId": 917723885,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0294.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:15\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:15\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:15\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 929594711,
                        "poseId": 929594711,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0214_1.JPG",
                        "intrinsicId": 697564746,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:11:22\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:11:22\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:11:22\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"50\", \"Exif:FocalLengthIn35mmFilm\": \"75\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 936449822,
                        "poseId": 936449822,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0332.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:16:10\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:16:10\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:16:10\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 954910707,
                        "poseId": 954910707,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0268.JPG",
                        "intrinsicId": 2738572050,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:41\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:41\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:41\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"52\", \"Exif:FocalLengthIn35mmFilm\": \"78\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 960176893,
                        "poseId": 960176893,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0213_1.JPG",
                        "intrinsicId": 697564746,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:11:12\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:11:12\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:11:12\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"50\", \"Exif:FocalLengthIn35mmFilm\": \"75\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 985930354,
                        "poseId": 985930354,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0307.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:42\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:42\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:42\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 995431994,
                        "poseId": 995431994,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0305.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:41\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:41\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:41\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1058483518,
                        "poseId": 1058483518,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0287.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:01\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:01\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:01\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1068270095,
                        "poseId": 1068270095,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0258.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:12\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:12\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:12\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1089843876,
                        "poseId": 1089843876,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0329.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:16:08\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:16:08\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:16:08\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1105422931,
                        "poseId": 1105422931,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0219_1.JPG",
                        "intrinsicId": 697564746,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:11:44\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:11:44\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:11:44\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"50\", \"Exif:FocalLengthIn35mmFilm\": \"75\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1109532952,
                        "poseId": 1109532952,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0317.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:57\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:57\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:57\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1115249507,
                        "poseId": 1115249507,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0227_1.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:12:16\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:12:16\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:12:16\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1120897133,
                        "poseId": 1120897133,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0223_1.JPG",
                        "intrinsicId": 2738572050,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:12:00\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:12:00\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:12:00\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"52\", \"Exif:FocalLengthIn35mmFilm\": \"78\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1143285499,
                        "poseId": 1143285499,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0246.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:13:20\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:13:20\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:13:20\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1150980014,
                        "poseId": 1150980014,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0313.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:52\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:52\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:52\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1168330216,
                        "poseId": 1168330216,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0247.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:13:23\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:13:23\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:13:23\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1168758900,
                        "poseId": 1168758900,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0245.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:13:16\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:13:16\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:13:16\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1170875762,
                        "poseId": 1170875762,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0320.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:58\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:58\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:58\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1173983702,
                        "poseId": 1173983702,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0222_1.JPG",
                        "intrinsicId": 2738572050,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:11:57\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:11:57\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:11:57\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"52\", \"Exif:FocalLengthIn35mmFilm\": \"78\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1192901234,
                        "poseId": 1192901234,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0239_1.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:12:57\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:12:57\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:12:57\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1198444984,
                        "poseId": 1198444984,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0328.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:16:07\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:16:07\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:16:07\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1200832368,
                        "poseId": 1200832368,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0344.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:16:41\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:16:41\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:16:41\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1218206290,
                        "poseId": 1218206290,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0249.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:13:35\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:13:35\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:13:35\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1242061242,
                        "poseId": 1242061242,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0269.JPG",
                        "intrinsicId": 2738572050,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:41\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:41\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:41\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"52\", \"Exif:FocalLengthIn35mmFilm\": \"78\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1296636621,
                        "poseId": 1296636621,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0304.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:40\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:40\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:40\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1306851159,
                        "poseId": 1306851159,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0309.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:43\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:43\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:43\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1309502080,
                        "poseId": 1309502080,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0327.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:16:07\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:16:07\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:16:07\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1325209436,
                        "poseId": 1325209436,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0260.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:14\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:14\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:14\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1331411298,
                        "poseId": 1331411298,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0248.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:13:25\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:13:25\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:13:25\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"1400\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1366630801,
                        "poseId": 1366630801,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0338.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:16:27\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:16:27\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:16:27\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"1250\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1370922838,
                        "poseId": 1370922838,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0296.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:19\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:19\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:19\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1378982342,
                        "poseId": 1378982342,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0324.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:16:05\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:16:05\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:16:05\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"1600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1399112424,
                        "poseId": 1399112424,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0224_1.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:12:05\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:12:05\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:12:05\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1435099922,
                        "poseId": 1435099922,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0298.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:24\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:24\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:24\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1436128524,
                        "poseId": 1436128524,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0259.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:14\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:14\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:14\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1441899831,
                        "poseId": 1441899831,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0283.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:58\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:58\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:58\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1443589627,
                        "poseId": 1443589627,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0236_1.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:12:48\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:12:48\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:12:48\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1470471141,
                        "poseId": 1470471141,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0217_1.JPG",
                        "intrinsicId": 697564746,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:11:35\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:11:35\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:11:35\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"50\", \"Exif:FocalLengthIn35mmFilm\": \"75\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1487644500,
                        "poseId": 1487644500,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0243_1.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:13:11\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:13:11\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:13:11\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1499173027,
                        "poseId": 1499173027,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0322.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:59\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:59\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:59\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1522618792,
                        "poseId": 1522618792,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0278.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:48\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:48\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:48\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"5000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1596605098,
                        "poseId": 1596605098,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0240_1.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:13:01\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:13:01\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:13:01\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1598257563,
                        "poseId": 1598257563,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0242_1.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:13:07\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:13:07\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:13:07\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"6400\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1608832726,
                        "poseId": 1608832726,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0295.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:17\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:17\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:17\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1628787786,
                        "poseId": 1628787786,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0315.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:56\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:56\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:56\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1635974777,
                        "poseId": 1635974777,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0233_1.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:12:37\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:12:37\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:12:37\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1643941922,
                        "poseId": 1643941922,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0333.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:16:24\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:16:24\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:16:24\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1657376959,
                        "poseId": 1657376959,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0323.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:16:00\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:16:00\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:16:00\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1671667239,
                        "poseId": 1671667239,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0285.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:59\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:59\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:59\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1689999242,
                        "poseId": 1689999242,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0244.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:13:14\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:13:14\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:13:14\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1693711713,
                        "poseId": 1693711713,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0280.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:51\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:51\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:51\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1694784164,
                        "poseId": 1694784164,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0234_1.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:12:41\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:12:41\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:12:41\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1700347494,
                        "poseId": 1700347494,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0257.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:08\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:08\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:08\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1790338512,
                        "poseId": 1790338512,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0232_1.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:12:34\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:12:34\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:12:34\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1797744036,
                        "poseId": 1797744036,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0270.JPG",
                        "intrinsicId": 2738572050,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:41\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:41\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:41\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"52\", \"Exif:FocalLengthIn35mmFilm\": \"78\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1864796967,
                        "poseId": 1864796967,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0218_1.JPG",
                        "intrinsicId": 697564746,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:11:40\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:11:40\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:11:40\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"50\", \"Exif:FocalLengthIn35mmFilm\": \"75\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1874026316,
                        "poseId": 1874026316,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0308.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:42\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:42\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:42\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1910675473,
                        "poseId": 1910675473,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0310.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:43\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:43\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:43\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1913443782,
                        "poseId": 1913443782,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0265.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:17\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:17\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:17\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"5600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1921599792,
                        "poseId": 1921599792,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0300.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:36\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:36\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:36\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1922583582,
                        "poseId": 1922583582,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0277.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:47\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:47\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:47\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"5000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1924706587,
                        "poseId": 1924706587,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0275.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:46\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:46\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:46\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1935077333,
                        "poseId": 1935077333,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0289.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:01\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:01\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:01\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1976906649,
                        "poseId": 1976906649,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0255.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:13:48\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:13:48\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:13:48\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"6400\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2072831305,
                        "poseId": 2072831305,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0273.JPG",
                        "intrinsicId": 2738572050,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:43\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:43\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:43\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"52\", \"Exif:FocalLengthIn35mmFilm\": \"78\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2092626831,
                        "poseId": 2092626831,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0312.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:15:49\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:15:49\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:15:49\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2131263506,
                        "poseId": 2131263506,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0241_1.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:13:04\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:13:04\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:13:04\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2134302781,
                        "poseId": 2134302781,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0251.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:13:39\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:13:39\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:13:39\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2143695913,
                        "poseId": 2143695913,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch2/DSC_0264.JPG",
                        "intrinsicId": 1041567122,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:14:17\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:14:17\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:14:17\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"4500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5.6\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 697564746,
                        "initialFocalLength": 50.0,
                        "focalLength": 50.0,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 6000,
                        "height": 4000,
                        "sensorWidth": 23.5,
                        "sensorHeight": 15.666666666666666,
                        "serialNumber": "/home/invisible/Downloads/photogrammetry_experiment/batch2_NIKON CORPORATION_NIKON D5300",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "estimated",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1041567122,
                        "initialFocalLength": 55.0,
                        "focalLength": 55.0,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 6000,
                        "height": 4000,
                        "sensorWidth": 23.5,
                        "sensorHeight": 15.666666666666666,
                        "serialNumber": "/home/invisible/Downloads/photogrammetry_experiment/batch2_NIKON CORPORATION_NIKON D5300",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "estimated",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1659052004,
                        "initialFocalLength": 47.99999999999999,
                        "focalLength": 47.99999999999999,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 6000,
                        "height": 4000,
                        "sensorWidth": 23.5,
                        "sensorHeight": 15.666666666666666,
                        "serialNumber": "/home/invisible/Downloads/photogrammetry_experiment/batch2_NIKON CORPORATION_NIKON D5300",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "estimated",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2738572050,
                        "initialFocalLength": 52.0,
                        "focalLength": 52.0,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 6000,
                        "height": 4000,
                        "sensorWidth": 23.5,
                        "sensorHeight": 15.666666666666666,
                        "serialNumber": "/home/invisible/Downloads/photogrammetry_experiment/batch2_NIKON CORPORATION_NIKON D5300",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "estimated",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    }
                ],
                "sensorDatabase": "${ALICEVISION_SENSOR_DB}",
                "lensCorrectionProfileInfo": "${ALICEVISION_LENS_PROFILE_INFO}",
                "lensCorrectionProfileSearchIgnoreCameraModel": true,
                "defaultFieldOfView": 45.0,
                "groupCameraFallback": "folder",
                "allowedCameraModels": [
                    "pinhole",
                    "radial1",
                    "radial3",
                    "brown",
                    "fisheye4",
                    "fisheye1",
                    "3deanamorphic4",
                    "3deradial4",
                    "3declassicld"
                ],
                "rawColorInterpretation": "LibRawWhiteBalancing",
                "colorProfileDatabase": "${ALICEVISION_COLOR_PROFILE_DB}",
                "errorOnMissingColorProfile": true,
                "viewIdMethod": "metadata",
                "viewIdRegex": ".*?(\\d+)",
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/cameraInit.sfm"
            }
        },
        "DepthMap_1": {
            "nodeType": "DepthMap",
            "position": [
                1200,
                0
            ],
            "parallelization": {
                "blockSize": 12,
                "size": 115,
                "split": 10
            },
            "uids": {
                "0": "464d4de4080e85f00c002ab417425d37a896fdda"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{PrepareDenseScene_1.input}",
                "imagesFolder": "{PrepareDenseScene_1.output}",
                "downscale": 2,
                "minViewAngle": 2.0,
                "maxViewAngle": 70.0,
                "tiling": {
                    "tileBufferWidth": 1024,
                    "tileBufferHeight": 1024,
                    "tilePadding": 64,
                    "autoAdjustSmallImage": true
                },
                "chooseTCamsPerTile": true,
                "maxTCams": 10,
                "sgm": {
                    "sgmScale": 2,
                    "sgmStepXY": 2,
                    "sgmStepZ": -1,
                    "sgmMaxTCamsPerTile": 4,
                    "sgmWSH": 4,
                    "sgmUseSfmSeeds": true,
                    "sgmSeedsRangeInflate": 0.2,
                    "sgmDepthThicknessInflate": 0.0,
                    "sgmMaxSimilarity": 1.0,
                    "sgmGammaC": 5.5,
                    "sgmGammaP": 8.0,
                    "sgmP1": 10.0,
                    "sgmP2Weighting": 100.0,
                    "sgmMaxDepths": 1500,
                    "sgmFilteringAxes": "YX",
                    "sgmDepthListPerTile": true,
                    "sgmUseConsistentScale": false
                },
                "refine": {
                    "refineEnabled": true,
                    "refineScale": 1,
                    "refineStepXY": 1,
                    "refineMaxTCamsPerTile": 4,
                    "refineSubsampling": 10,
                    "refineHalfNbDepths": 15,
                    "refineWSH": 3,
                    "refineSigma": 15.0,
                    "refineGammaC": 15.5,
                    "refineGammaP": 8.0,
                    "refineInterpolateMiddleDepth": false,
                    "refineUseConsistentScale": false
                },
                "colorOptimization": {
                    "colorOptimizationEnabled": true,
                    "colorOptimizationNbIterations": 100
                },
                "customPatchPattern": {
                    "sgmUseCustomPatchPattern": false,
                    "refineUseCustomPatchPattern": false,
                    "customPatchPatternSubparts": [],
                    "customPatchPatternGroupSubpartsPerLevel": false
                },
                "intermediateResults": {
                    "exportIntermediateDepthSimMaps": false,
                    "exportIntermediateNormalMaps": false,
                    "exportIntermediateVolumes": false,
                    "exportIntermediateCrossVolumes": false,
                    "exportIntermediateTopographicCutVolumes": false,
                    "exportIntermediateVolume9pCsv": false,
                    "exportTilePattern": false
                },
                "nbGPUs": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "depth": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap.exr",
                "sim": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_simMap.exr",
                "tilePattern": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_tilePattern.obj",
                "depthSgm": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap_sgm.exr",
                "depthSgmUpscaled": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap_sgmUpscaled.exr",
                "depthRefined": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap_refinedFused.exr"
            }
        },
        "MeshFiltering_1": {
            "nodeType": "MeshFiltering",
            "position": [
                1800,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "87e60c8b3bb0d5ff00fd56d7d0669e56db3922fd"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "inputMesh": "{Meshing_1.outputMesh}",
                "outputMeshFileType": "obj",
                "keepLargestMeshOnly": false,
                "smoothingSubset": "all",
                "smoothingBoundariesNeighbours": 0,
                "smoothingIterations": 5,
                "smoothingLambda": 1.0,
                "filteringSubset": "all",
                "filteringIterations": 1,
                "filterLargeTrianglesFactor": 60.0,
                "filterTrianglesRatio": 0.0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "outputMesh": "{cache}/{nodeType}/{uid0}/mesh.{outputMeshFileTypeValue}"
            }
        },
        "FeatureMatching_1": {
            "nodeType": "FeatureMatching",
            "position": [
                600,
                0
            ],
            "parallelization": {
                "blockSize": 20,
                "size": 115,
                "split": 6
            },
            "uids": {
                "0": "67111d8c9aac68e7c4d27cd31c88cd3c9a0aaaaa"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{ImageMatching_1.input}",
                "featuresFolders": "{ImageMatching_1.featuresFolders}",
                "imagePairsList": "{ImageMatching_1.output}",
                "describerTypes": "{FeatureExtraction_1.describerTypes}",
                "photometricMatchingMethod": "ANN_L2",
                "geometricEstimator": "acransac",
                "geometricFilterType": "fundamental_matrix",
                "distanceRatio": 0.8,
                "maxIteration": 2048,
                "geometricError": 0.0,
                "knownPosesGeometricErrorMax": 5.0,
                "minRequired2DMotion": -1.0,
                "maxMatches": 0,
                "savePutativeMatches": false,
                "crossMatching": false,
                "guidedMatching": false,
                "matchFromKnownCameraPoses": false,
                "exportDebugFiles": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }
        }
    }
}
