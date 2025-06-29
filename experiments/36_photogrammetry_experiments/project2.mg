{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.3.0",
        "fileVersion": "1.1",
        "template": false,
        "nodesVersions": {
            "DepthMapFilter": "4.0",
            "ImageMatching": "2.0",
            "MeshFiltering": "3.0",
            "FeatureMatching": "2.0",
            "Meshing": "7.0",
            "DepthMap": "5.0",
            "PrepareDenseScene": "3.1",
            "StructureFromMotion": "3.3",
            "Texturing": "6.0",
            "FeatureExtraction": "1.3",
            "CameraInit": "9.0"
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
                "0": "58f8333c1cfe22615f5c240d55bc3b2d5107328e"
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
                "0": "aafa7d6aa68b7a644ed03a7c280c119c69b11339"
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
                "size": 404,
                "split": 17
            },
            "uids": {
                "0": "ea2f82209641ffe04189311811fe16fbfe6956ed"
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
                "size": 404,
                "split": 1
            },
            "uids": {
                "0": "9c379cd63d4da5bd4773f85e92cf1cf16fd14e76"
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
                "size": 404,
                "split": 11
            },
            "uids": {
                "0": "0248c7aea8477fcb1473793e27f424055225ea0e"
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
                "size": 404,
                "split": 1
            },
            "uids": {
                "0": "0519742030d2937b809c7435456c5f37a59d7a07"
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
                "size": 404,
                "split": 11
            },
            "uids": {
                "0": "953b9a49e628092312e3b94166783d711ee71605"
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
                "size": 404,
                "split": 1
            },
            "uids": {
                "0": "1c977a14d9c73b2b6be16dd4912c656a0225dee8"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 11525835,
                        "poseId": 11525835,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0320_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:06\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:06\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:06\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
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
                        "viewId": 33948241,
                        "poseId": 33948241,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0483.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:56\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:56\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:56\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 35863215,
                        "poseId": 35863215,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0578.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:53\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:53\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:53\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 44021144,
                        "poseId": 44021144,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0318_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:06\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:06\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:06\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 46533899,
                        "poseId": 46533899,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0278_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:41\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:41\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:41\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 46791327,
                        "poseId": 46791327,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0277_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:40\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:40\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:40\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 64948355,
                        "poseId": 64948355,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0273_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:40\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:40\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:40\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 66667770,
                        "poseId": 66667770,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0481.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:53\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:53\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:53\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 73880378,
                        "poseId": 73880378,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0540.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:35\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:35\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:35\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 83876873,
                        "poseId": 83876873,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0421.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:00\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:00\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:00\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 85954373,
                        "poseId": 85954373,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0445.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:09\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:09\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:09\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 93757024,
                        "poseId": 93757024,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0413.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:58\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:58\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:58\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 94388048,
                        "poseId": 94388048,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0605.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:07\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:07\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:07\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 94899661,
                        "poseId": 94899661,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0316_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:05\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:05\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:05\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 100718064,
                        "poseId": 100718064,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0486.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:00\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:00\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:00\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 103515001,
                        "poseId": 103515001,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0465.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:30\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:30\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:30\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 108343452,
                        "poseId": 108343452,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0339_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:20\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:20\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:20\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 125889723,
                        "poseId": 125889723,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0312_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:04\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:04\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:04\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 139242227,
                        "poseId": 139242227,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0251_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:25\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:25\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:25\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 146007301,
                        "poseId": 146007301,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0596.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:04\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:04\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:04\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 162974679,
                        "poseId": 162974679,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0292_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:54\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:54\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:54\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 167260456,
                        "poseId": 167260456,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0609.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:08\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:08\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:08\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 167296362,
                        "poseId": 167296362,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0263_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:27\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:27\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:27\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 170495287,
                        "poseId": 170495287,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0334_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:09\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:09\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:09\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 177724184,
                        "poseId": 177724184,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0343_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:21\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:21\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:21\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 183054588,
                        "poseId": 183054588,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0323_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:07\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:07\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:07\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 211916946,
                        "poseId": 211916946,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0566.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:51\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:51\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:51\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 218707474,
                        "poseId": 218707474,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0252_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:25\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:25\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:25\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 234165600,
                        "poseId": 234165600,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0494.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:09\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:09\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:09\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 246390796,
                        "poseId": 246390796,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0253_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:25\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:25\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:25\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 253123047,
                        "poseId": 253123047,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0257_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:26\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:26\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:26\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 269807486,
                        "poseId": 269807486,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0521.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:24\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:24\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:24\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 273311343,
                        "poseId": 273311343,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0338_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:20\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:20\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:20\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 289077765,
                        "poseId": 289077765,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0249_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:22\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:22\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:22\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 289173236,
                        "poseId": 289173236,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0579.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:54\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:54\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:54\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 302145895,
                        "poseId": 302145895,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0573.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:52\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:52\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:52\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 307603919,
                        "poseId": 307603919,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0259_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:26\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:26\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:26\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 310911418,
                        "poseId": 310911418,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0238_2.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:02\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:02\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:02\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 332567844,
                        "poseId": 332567844,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0275_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:40\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:40\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:40\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 332668414,
                        "poseId": 332668414,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0491.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:08\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:08\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:08\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 333363774,
                        "poseId": 333363774,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0368.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:39\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:39\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:39\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 346818104,
                        "poseId": 346818104,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0279_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:41\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:41\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:41\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 357902047,
                        "poseId": 357902047,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0532.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:31\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:31\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:31\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 378884895,
                        "poseId": 378884895,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0371.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:39\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:39\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:39\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 379186164,
                        "poseId": 379186164,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0552.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:44\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:44\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:44\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 381244613,
                        "poseId": 381244613,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0362.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:37\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:37\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:37\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 383206040,
                        "poseId": 383206040,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0524.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:25\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:25\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:25\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 384407511,
                        "poseId": 384407511,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0555.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:45\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:45\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:45\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 389483319,
                        "poseId": 389483319,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0530.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:30\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:30\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:30\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 390409962,
                        "poseId": 390409962,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0541.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:35\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:35\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:35\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 390866637,
                        "poseId": 390866637,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0462.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:29\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:29\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:29\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 397545736,
                        "poseId": 397545736,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0325_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:07\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:07\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:07\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 401656923,
                        "poseId": 401656923,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0479.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:52\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:52\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:52\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 402213594,
                        "poseId": 402213594,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0499.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:11\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:11\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:11\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 406444167,
                        "poseId": 406444167,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0326_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:07\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:07\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:07\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 415285460,
                        "poseId": 415285460,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0337_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:20\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:20\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:20\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 418954823,
                        "poseId": 418954823,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0363.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:38\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:38\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:38\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 451453739,
                        "poseId": 451453739,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0299_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:55\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:55\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:55\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 453821863,
                        "poseId": 453821863,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0329_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:08\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:08\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:08\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 458889764,
                        "poseId": 458889764,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0468.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:30\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:30\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:30\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 459538767,
                        "poseId": 459538767,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0321_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:06\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:06\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:06\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 468079600,
                        "poseId": 468079600,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0370.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:39\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:39\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:39\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 470500501,
                        "poseId": 470500501,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0417.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:59\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:59\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:59\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 499159316,
                        "poseId": 499159316,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0341_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:21\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:21\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:21\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 500653614,
                        "poseId": 500653614,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0516.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:23\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:23\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:23\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 502259688,
                        "poseId": 502259688,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0304_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:56\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:56\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:56\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 519766747,
                        "poseId": 519766747,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0367.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:38\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:38\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:38\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 519785690,
                        "poseId": 519785690,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0425.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:03\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:03\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:03\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 520604752,
                        "poseId": 520604752,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0314_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:05\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:05\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:05\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 528237390,
                        "poseId": 528237390,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0506.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:14\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:14\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:14\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 531953476,
                        "poseId": 531953476,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0571.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:52\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:52\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:52\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 535263819,
                        "poseId": 535263819,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0534.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:31\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:31\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:31\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 536863667,
                        "poseId": 536863667,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0563.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:46\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:46\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:46\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 548076229,
                        "poseId": 548076229,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0505.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:13\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:13\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:13\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 552141801,
                        "poseId": 552141801,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0340_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:20\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:20\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:20\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 559467444,
                        "poseId": 559467444,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0517.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:23\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:23\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:23\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 563488602,
                        "poseId": 563488602,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0554.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:44\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:44\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:44\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 570737663,
                        "poseId": 570737663,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0409.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:57\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:57\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:57\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 579601067,
                        "poseId": 579601067,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0477.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:46\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:46\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:46\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 581213354,
                        "poseId": 581213354,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0508.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:15\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:15\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:15\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 592966050,
                        "poseId": 592966050,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0347_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:22\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:22\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:22\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 593327227,
                        "poseId": 593327227,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0228_2.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:00\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:00\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:00\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 602589556,
                        "poseId": 602589556,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0608.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:07\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:07\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:07\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 604894066,
                        "poseId": 604894066,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0575.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:53\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:53\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:53\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 605265775,
                        "poseId": 605265775,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0515.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:23\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:23\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:23\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 618480395,
                        "poseId": 618480395,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0271_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:39\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:39\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:39\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 635365781,
                        "poseId": 635365781,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0406.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:57\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:57\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:57\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 645953754,
                        "poseId": 645953754,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0237_2.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:01\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:01\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:01\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 664719679,
                        "poseId": 664719679,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0327_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:07\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:07\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:07\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 674440290,
                        "poseId": 674440290,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0231_2.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:00\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:00\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:00\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 674461736,
                        "poseId": 674461736,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0557.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:45\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:45\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:45\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 681871158,
                        "poseId": 681871158,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0315_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:05\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:05\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:05\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 683332243,
                        "poseId": 683332243,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0485.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:59\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:59\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:59\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 693471672,
                        "poseId": 693471672,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0527.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:30\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:30\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:30\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 695934229,
                        "poseId": 695934229,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0372.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:39\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:39\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:39\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 702313177,
                        "poseId": 702313177,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0348_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:22\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:22\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:22\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 702804287,
                        "poseId": 702804287,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0267_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:38\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:38\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:38\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 703585661,
                        "poseId": 703585661,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0544.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:42\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:42\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:42\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 713105364,
                        "poseId": 713105364,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0306_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:56\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:56\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:56\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 730607637,
                        "poseId": 730607637,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0232_2.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:00\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:00\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:00\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 734893572,
                        "poseId": 734893572,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0319_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:06\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:06\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:06\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 735110379,
                        "poseId": 735110379,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0590.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:03\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:03\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:03\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 742326579,
                        "poseId": 742326579,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0313_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:05\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:05\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:05\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 755666542,
                        "poseId": 755666542,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0593.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:04\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:04\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:04\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 768254253,
                        "poseId": 768254253,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0243_2.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:03\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:03\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:03\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 769905095,
                        "poseId": 769905095,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0276_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:40\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:40\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:40\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 773124326,
                        "poseId": 773124326,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0212_2.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:28:34\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:28:34\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:28:34\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 784057268,
                        "poseId": 784057268,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0333_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:09\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:09\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:09\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 786841447,
                        "poseId": 786841447,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0365.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:38\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:38\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:38\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 789536266,
                        "poseId": 789536266,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0293_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:54\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:54\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:54\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 796870799,
                        "poseId": 796870799,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0366.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:38\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:38\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:38\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 798499454,
                        "poseId": 798499454,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0444.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:09\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:09\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:09\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 801576966,
                        "poseId": 801576966,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0597.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:05\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:05\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:05\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 813588927,
                        "poseId": 813588927,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0548.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:43\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:43\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:43\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 820533843,
                        "poseId": 820533843,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0264_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:27\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:27\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:27\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 820673475,
                        "poseId": 820673475,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0459.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:27\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:27\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:27\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 825034517,
                        "poseId": 825034517,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0346_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:22\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:22\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:22\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 841842160,
                        "poseId": 841842160,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0467.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:30\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:30\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:30\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 841860834,
                        "poseId": 841860834,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0301_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:55\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:55\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:55\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 862281863,
                        "poseId": 862281863,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0603.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:06\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:06\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:06\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 876225085,
                        "poseId": 876225085,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0434.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:05\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:05\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:05\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 878047973,
                        "poseId": 878047973,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0567.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:51\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:51\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:51\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 881497326,
                        "poseId": 881497326,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0407.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:57\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:57\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:57\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 892084619,
                        "poseId": 892084619,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0378.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:41\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:41\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:41\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 904242310,
                        "poseId": 904242310,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0382.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:41\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:41\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:41\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 912319959,
                        "poseId": 912319959,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0513.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:22\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:22\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:22\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 916478402,
                        "poseId": 916478402,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0474.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:42\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:42\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:42\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 923479305,
                        "poseId": 923479305,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0418.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:59\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:59\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:59\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 925969167,
                        "poseId": 925969167,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0430.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:04\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:04\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:04\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 927349822,
                        "poseId": 927349822,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0247_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:03\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:03\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:03\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 941895688,
                        "poseId": 941895688,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0359.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:37\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:37\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:37\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 953489298,
                        "poseId": 953489298,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0453.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:26\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:26\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:26\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 954770976,
                        "poseId": 954770976,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0543.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:36\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:36\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:36\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 957007874,
                        "poseId": 957007874,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0464.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:29\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:29\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:29\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 960844617,
                        "poseId": 960844617,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0254_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:25\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:25\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:25\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 975780032,
                        "poseId": 975780032,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0274_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:40\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:40\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:40\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 992681693,
                        "poseId": 992681693,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0472.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:39\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:39\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:39\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 995635056,
                        "poseId": 995635056,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0290_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:53\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:53\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:53\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1001964402,
                        "poseId": 1001964402,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0598.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:05\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:05\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:05\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1003484619,
                        "poseId": 1003484619,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0461.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:28\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:28\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:28\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1004959697,
                        "poseId": 1004959697,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0466.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:30\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:30\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:30\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1006839593,
                        "poseId": 1006839593,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0526.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:30\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:30\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:30\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1021285504,
                        "poseId": 1021285504,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0502.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:12\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:12\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:12\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1025652082,
                        "poseId": 1025652082,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0322_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:06\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:06\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:06\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1027063734,
                        "poseId": 1027063734,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0482.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:54\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:54\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:54\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1032422478,
                        "poseId": 1032422478,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0280_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:41\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:41\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:41\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1050511687,
                        "poseId": 1050511687,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0447.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:19\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:19\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:19\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1064925159,
                        "poseId": 1064925159,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0525.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:26\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:26\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:26\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1071570564,
                        "poseId": 1071570564,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0261_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:27\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:27\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:27\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1080365347,
                        "poseId": 1080365347,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0268_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:39\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:39\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:39\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1084464180,
                        "poseId": 1084464180,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0542.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:36\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:36\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:36\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1093465302,
                        "poseId": 1093465302,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0269_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:39\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:39\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:39\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1094287262,
                        "poseId": 1094287262,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0454.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:26\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:26\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:26\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1096337382,
                        "poseId": 1096337382,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0303_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:56\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:56\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:56\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1104558329,
                        "poseId": 1104558329,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0602.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:06\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:06\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:06\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1114880550,
                        "poseId": 1114880550,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0360.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:37\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:37\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:37\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1118182547,
                        "poseId": 1118182547,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0239_2.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:02\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:02\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:02\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1126899977,
                        "poseId": 1126899977,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0536.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:34\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:34\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:34\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1129209885,
                        "poseId": 1129209885,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0594.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:04\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:04\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:04\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1133560278,
                        "poseId": 1133560278,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0408.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:57\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:57\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:57\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1144715784,
                        "poseId": 1144715784,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0546.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:43\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:43\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:43\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1174985896,
                        "poseId": 1174985896,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0600.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:06\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:06\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:06\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1175306025,
                        "poseId": 1175306025,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0423.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:03\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:03\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:03\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1192703721,
                        "poseId": 1192703721,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0361.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:37\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:37\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:37\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1196464322,
                        "poseId": 1196464322,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0335_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:19\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:19\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:19\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1198842960,
                        "poseId": 1198842960,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0476.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:45\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:45\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:45\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1215231623,
                        "poseId": 1215231623,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0492.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:09\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:09\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:09\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1215582336,
                        "poseId": 1215582336,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0473.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:40\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:40\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:40\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1216326938,
                        "poseId": 1216326938,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0514.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:22\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:22\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:22\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1226400768,
                        "poseId": 1226400768,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0458.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:27\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:27\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:27\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1227044315,
                        "poseId": 1227044315,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0295_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:54\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:54\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:54\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1238414469,
                        "poseId": 1238414469,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0501.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:12\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:12\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:12\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1246289789,
                        "poseId": 1246289789,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0426.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:03\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:03\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:03\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1246781053,
                        "poseId": 1246781053,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0230_2.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:00\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:00\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:00\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1250800245,
                        "poseId": 1250800245,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0229_2.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:00\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:00\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:00\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1252892623,
                        "poseId": 1252892623,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0556.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:45\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:45\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:45\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1278029436,
                        "poseId": 1278029436,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0379.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:41\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:41\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:41\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1283203127,
                        "poseId": 1283203127,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0500.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:11\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:11\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:11\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1292602762,
                        "poseId": 1292602762,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0364.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:38\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:38\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:38\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1298402997,
                        "poseId": 1298402997,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0332_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:08\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:08\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:08\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1322866688,
                        "poseId": 1322866688,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0470.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:38\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:38\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:38\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1331469070,
                        "poseId": 1331469070,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0291_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:54\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:54\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:54\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1336897373,
                        "poseId": 1336897373,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0538.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:35\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:35\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:35\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1342353997,
                        "poseId": 1342353997,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0504.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:13\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:13\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:13\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1343928608,
                        "poseId": 1343928608,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0507.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:14\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:14\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:14\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1355849520,
                        "poseId": 1355849520,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0432.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:04\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:04\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:04\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1362680527,
                        "poseId": 1362680527,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0463.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:29\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:29\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:29\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1368375378,
                        "poseId": 1368375378,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0610.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:08\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:08\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:08\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1371459211,
                        "poseId": 1371459211,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0281_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:41\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:41\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:41\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1382234631,
                        "poseId": 1382234631,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0369.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:39\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:39\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:39\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1391477884,
                        "poseId": 1391477884,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0531.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:31\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:31\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:31\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1391636887,
                        "poseId": 1391636887,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0606.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:07\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:07\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:07\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1392810885,
                        "poseId": 1392810885,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0427.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:03\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:03\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:03\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1392884608,
                        "poseId": 1392884608,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0520.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:24\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:24\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:24\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1396471438,
                        "poseId": 1396471438,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0607.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:07\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:07\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:07\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1404481105,
                        "poseId": 1404481105,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0522.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:25\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:25\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:25\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1406900999,
                        "poseId": 1406900999,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0457.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:27\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:27\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:27\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1413009405,
                        "poseId": 1413009405,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0250_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:24\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:24\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:24\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1419598915,
                        "poseId": 1419598915,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0374.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:40\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:40\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:40\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1432277937,
                        "poseId": 1432277937,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0240_2.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:02\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:02\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:02\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1439031735,
                        "poseId": 1439031735,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0294_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:54\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:54\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:54\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1449092923,
                        "poseId": 1449092923,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0528.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:30\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:30\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:30\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1465500201,
                        "poseId": 1465500201,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0381.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:41\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:41\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:41\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1470559084,
                        "poseId": 1470559084,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0510.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:21\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:21\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:21\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1482215663,
                        "poseId": 1482215663,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0375.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:40\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:40\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:40\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1484390923,
                        "poseId": 1484390923,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0302_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:56\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:56\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:56\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1494813279,
                        "poseId": 1494813279,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0592.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:03\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:03\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:03\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1502264951,
                        "poseId": 1502264951,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0373.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:40\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:40\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:40\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1502631132,
                        "poseId": 1502631132,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0342_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:21\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:21\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:21\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1502905203,
                        "poseId": 1502905203,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0568.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:51\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:51\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:51\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1514795144,
                        "poseId": 1514795144,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0511.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:21\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:21\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:21\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1535206503,
                        "poseId": 1535206503,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0424.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:03\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:03\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:03\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1536557205,
                        "poseId": 1536557205,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0535.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:31\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:31\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:31\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1544559557,
                        "poseId": 1544559557,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0385.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:42\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:42\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:42\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1546671945,
                        "poseId": 1546671945,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0533.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:31\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:31\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:31\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1547335138,
                        "poseId": 1547335138,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0307_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:57\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:57\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:57\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1547854087,
                        "poseId": 1547854087,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0336_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:20\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:20\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:20\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1554479027,
                        "poseId": 1554479027,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0331_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:08\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:08\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:08\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1556327511,
                        "poseId": 1556327511,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0519.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:24\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:24\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:24\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1567886744,
                        "poseId": 1567886744,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0591.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:03\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:03\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:03\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1571602237,
                        "poseId": 1571602237,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0496.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:09\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:09\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:09\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1576420812,
                        "poseId": 1576420812,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0410.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:58\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:58\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:58\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1577755788,
                        "poseId": 1577755788,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0493.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:09\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:09\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:09\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1594785592,
                        "poseId": 1594785592,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0345_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:21\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:21\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:21\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1597081151,
                        "poseId": 1597081151,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0435.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:05\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:05\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:05\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1606915095,
                        "poseId": 1606915095,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0545.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:43\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:43\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:43\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1650856916,
                        "poseId": 1650856916,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0256_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:26\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:26\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:26\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1651806160,
                        "poseId": 1651806160,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0478.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:47\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:47\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:47\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1654971462,
                        "poseId": 1654971462,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0289_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:53\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:53\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:53\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1656795872,
                        "poseId": 1656795872,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0419.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:59\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:59\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:59\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1657531373,
                        "poseId": 1657531373,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0577.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:53\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:53\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:53\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1657551931,
                        "poseId": 1657551931,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0328_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:08\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:08\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:08\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1666076212,
                        "poseId": 1666076212,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0529.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:30\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:30\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:30\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1678372114,
                        "poseId": 1678372114,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0469.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:31\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:31\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:31\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1680635451,
                        "poseId": 1680635451,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0272_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:39\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:39\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:39\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1682277713,
                        "poseId": 1682277713,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0601.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:06\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:06\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:06\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1694136777,
                        "poseId": 1694136777,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0580.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:54\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:54\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:54\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1697454948,
                        "poseId": 1697454948,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0386.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:42\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:42\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:42\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1698374973,
                        "poseId": 1698374973,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0384.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:42\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:42\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:42\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1700287336,
                        "poseId": 1700287336,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0576.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:53\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:53\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:53\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1733207506,
                        "poseId": 1733207506,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0317_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:05\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:05\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:05\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1737335813,
                        "poseId": 1737335813,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0433.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:05\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:05\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:05\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1738635783,
                        "poseId": 1738635783,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0537.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:35\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:35\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:35\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1750819740,
                        "poseId": 1750819740,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0509.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:15\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:15\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:15\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1752021339,
                        "poseId": 1752021339,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0255_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:25\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:25\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:25\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1757529345,
                        "poseId": 1757529345,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0595.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:04\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:04\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:04\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1762193209,
                        "poseId": 1762193209,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0305_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:56\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:56\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:56\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1775774204,
                        "poseId": 1775774204,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0376.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:40\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:40\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:40\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1784308469,
                        "poseId": 1784308469,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0487.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:01\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:01\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:01\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1790028161,
                        "poseId": 1790028161,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0383.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:42\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:42\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:42\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1799232851,
                        "poseId": 1799232851,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0411.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:58\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:58\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:58\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1807313914,
                        "poseId": 1807313914,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0604.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:07\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:07\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:07\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1811758351,
                        "poseId": 1811758351,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0503.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:13\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:13\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:13\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1821458402,
                        "poseId": 1821458402,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0455.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:26\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:26\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:26\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1828778393,
                        "poseId": 1828778393,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0431.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:04\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:04\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:04\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1831490819,
                        "poseId": 1831490819,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0471.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:38\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:38\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:38\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1831812454,
                        "poseId": 1831812454,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0262_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:27\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:27\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:27\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1838232194,
                        "poseId": 1838232194,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0414.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:58\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:58\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:58\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1846920542,
                        "poseId": 1846920542,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0298_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:55\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:55\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:55\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1868301999,
                        "poseId": 1868301999,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0572.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:52\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:52\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:52\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1878787299,
                        "poseId": 1878787299,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0570.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:52\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:52\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:52\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1881524696,
                        "poseId": 1881524696,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0561.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:46\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:46\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:46\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1883361161,
                        "poseId": 1883361161,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0523.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:25\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:25\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:25\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1922186846,
                        "poseId": 1922186846,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0569.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:51\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:51\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:51\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1923790126,
                        "poseId": 1923790126,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0460.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:28\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:28\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:28\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1943337442,
                        "poseId": 1943337442,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0210_2.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:28:33\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:28:33\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:28:33\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1951992010,
                        "poseId": 1951992010,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0233_2.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:01\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:01\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:01\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1961903111,
                        "poseId": 1961903111,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0296_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:55\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:55\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:55\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1973286511,
                        "poseId": 1973286511,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0599.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:33:06\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:33:06\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:33:06\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 1983816244,
                        "poseId": 1983816244,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0518.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:23\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:23\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:23\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1986783160,
                        "poseId": 1986783160,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0380.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:41\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:41\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:41\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1993433180,
                        "poseId": 1993433180,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0480.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:53\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:53\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:53\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2002304845,
                        "poseId": 2002304845,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0428.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:31:04\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:31:04\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:31:04\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2004935909,
                        "poseId": 2004935909,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0241_2.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:02\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:02\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:02\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2014560526,
                        "poseId": 2014560526,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0288_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:53\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:53\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:53\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2015087807,
                        "poseId": 2015087807,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0235_2.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:01\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:01\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:01\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2017231309,
                        "poseId": 2017231309,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0377.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:40\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:40\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:40\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2017717398,
                        "poseId": 2017717398,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0287_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:53\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:53\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:53\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2035087855,
                        "poseId": 2035087855,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0564.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:50\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:50\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:50\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2036141745,
                        "poseId": 2036141745,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0565.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:51\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:51\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:51\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2039299744,
                        "poseId": 2039299744,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0415.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:59\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:59\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:59\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2040831881,
                        "poseId": 2040831881,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0246_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:03\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:03\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:03\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2052656328,
                        "poseId": 2052656328,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0416.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:59\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:59\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:59\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2070254211,
                        "poseId": 2070254211,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0539.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:35\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:35\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:35\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 2088539312,
                        "poseId": 2088539312,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0258_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:26\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:26\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:26\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2091974693,
                        "poseId": 2091974693,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0270_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:29:39\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:29:39\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:29:39\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                        "viewId": 2107542776,
                        "poseId": 2107542776,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0344_1.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:30:21\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:30:21\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:30:21\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2112766181,
                        "poseId": 2112766181,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0512.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:22\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:22\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:22\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                    },
                    {
                        "viewId": 2144923667,
                        "poseId": 2144923667,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch3/DSC_0551.JPG",
                        "intrinsicId": 3809821833,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 14:32:44\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 14:32:44\", \"Exif:DateTimeOriginal\": \"2025:06:29 14:32:44\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"38\", \"Exif:FocalLengthIn35mmFilm\": \"57\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"12800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.004\", \"FNumber\": \"10\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
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
                    },
                    {
                        "intrinsicId": 3809821833,
                        "initialFocalLength": 38.0,
                        "focalLength": 38.0,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 6000,
                        "height": 4000,
                        "sensorWidth": 23.5,
                        "sensorHeight": 15.666666666666666,
                        "serialNumber": "/home/invisible/Downloads/photogrammetry_experiment/batch3_NIKON CORPORATION_NIKON D5300",
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
                "size": 404,
                "split": 34
            },
            "uids": {
                "0": "06ce3303b6a2d74b386f4e16067b6c7d9eb648e2"
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
                "0": "c6f40b117e41ba8c5e8fb364fd204d519b02a72f"
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
                "size": 404,
                "split": 21
            },
            "uids": {
                "0": "f9a72458d6752ca2f5291d46b2ef25d2fa224414"
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
