{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.3.0",
        "fileVersion": "1.1",
        "template": false,
        "nodesVersions": {
            "MeshFiltering": "3.0",
            "FeatureMatching": "2.0",
            "Texturing": "6.0",
            "PrepareDenseScene": "3.1",
            "Meshing": "7.0",
            "DepthMap": "5.0",
            "FeatureExtraction": "1.3",
            "CameraInit": "9.0",
            "StructureFromMotion": "3.3",
            "DepthMapFilter": "4.0",
            "ImageMatching": "2.0"
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
                "0": "b5b6f0c48ec4a504f5e54c068fb4b50399b8db46"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{Meshing_1.output}",
                "imagesFolder": "{DepthMap_1.imagesFolder}",
                "inputMesh": "{MeshFiltering_1.outputMesh}",
                "inputRefMesh": "",
                "textureSide": 4096,
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
                "0": "6b6e736c0e00d50efbef6c4f39ea550bb3d91abd"
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
                "size": 32,
                "split": 2
            },
            "uids": {
                "0": "579d843222bf186493500281ddebed75261c18b7"
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
                "size": 32,
                "split": 1
            },
            "uids": {
                "0": "c421af3eaf6eab657b424ee23622f95f9a608c29"
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
                "size": 32,
                "split": 1
            },
            "uids": {
                "0": "92a55a36895ae4228d891f2a31bc9726135ed3ec"
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
                "size": 32,
                "split": 1
            },
            "uids": {
                "0": "b23e07240201aa29e28faf238c379631756c22ec"
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
                "size": 32,
                "split": 1
            },
            "uids": {
                "0": "c70f91cc64704745831a589c7eefb533ca538720"
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
                "size": 32,
                "split": 1
            },
            "uids": {
                "0": "39a20af3eb17ff4b230f2ad5b0bd92f1b071882c"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 63546225,
                        "poseId": 63546225,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0234_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:24:20\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:24:20\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:24:20\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 294950683,
                        "poseId": 294950683,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0225_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:23:01\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:23:01\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:23:01\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"1800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 444632273,
                        "poseId": 444632273,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0211_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:20:53\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:20:53\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:20:53\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 467971907,
                        "poseId": 467971907,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0240_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:25:05\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:25:05\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:25:05\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 526866369,
                        "poseId": 526866369,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0215_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:21:36\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:21:36\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:21:36\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"900\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 570329163,
                        "poseId": 570329163,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0222_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:22:36\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:22:36\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:22:36\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 588208134,
                        "poseId": 588208134,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0223_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:22:45\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:22:45\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:22:45\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"1800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 632982903,
                        "poseId": 632982903,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0224_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:22:51\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:22:51\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:22:51\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 732698436,
                        "poseId": 732698436,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0238_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:24:51\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:24:51\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:24:51\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 778388886,
                        "poseId": 778388886,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0229_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:23:34\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:23:34\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:23:34\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"1600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1043648144,
                        "poseId": 1043648144,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0217_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:21:53\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:21:53\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:21:53\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1046859257,
                        "poseId": 1046859257,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0226_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:23:09\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:23:09\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:23:09\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2500\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1103720387,
                        "poseId": 1103720387,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0213_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:21:16\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:21:16\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:21:16\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1199673568,
                        "poseId": 1199673568,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0231_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:23:54\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:23:54\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:23:54\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"1600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1291877860,
                        "poseId": 1291877860,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0214_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:21:24\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:21:24\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:21:24\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1355474904,
                        "poseId": 1355474904,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0239_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:24:59\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:24:59\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:24:59\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"1600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1400302742,
                        "poseId": 1400302742,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0230_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:23:45\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:23:45\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:23:45\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1458593750,
                        "poseId": 1458593750,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0233_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:24:12\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:24:12\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:24:12\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1478553428,
                        "poseId": 1478553428,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0220_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:22:16\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:22:16\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:22:16\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1511076186,
                        "poseId": 1511076186,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0219_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:22:10\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:22:10\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:22:10\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1514168438,
                        "poseId": 1514168438,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0209_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:20:25\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:20:25\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:20:25\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1537450463,
                        "poseId": 1537450463,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0228_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:23:25\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:23:25\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:23:25\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1729577157,
                        "poseId": 1729577157,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0237_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:24:45\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:24:45\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:24:45\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"1600\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1747326964,
                        "poseId": 1747326964,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0212_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:21:05\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:21:05\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:21:05\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"3200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1760699065,
                        "poseId": 1760699065,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0210_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:20:40\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:20:40\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:20:40\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"1250\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1766915867,
                        "poseId": 1766915867,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0216_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:21:42\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:21:42\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:21:42\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"1400\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1806800403,
                        "poseId": 1806800403,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0236_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:24:36\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:24:36\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:24:36\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2800\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1933858471,
                        "poseId": 1933858471,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0218_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:22:00\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:22:00\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:22:00\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1939749279,
                        "poseId": 1939749279,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0232_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:24:01\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:24:01\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:24:01\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2031276361,
                        "poseId": 2031276361,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0235_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:24:28\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:24:28\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:24:28\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"1400\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2047485118,
                        "poseId": 2047485118,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0221_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:22:26\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:22:26\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:22:26\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2121648412,
                        "poseId": 2121648412,
                        "path": "/home/invisible/Downloads/photogrammetry_experiment/batch4/DSC_0227_3.JPG",
                        "intrinsicId": 2402141467,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:06:29 15:23:19\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:06:29 15:23:19\", \"Exif:DateTimeOriginal\": \"2025:06:29 15:23:19\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"0\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"45\", \"Exif:FocalLengthIn35mmFilm\": \"67\", \"Exif:GainControl\": \"2\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.7\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"2200\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"5\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Shotwell 0.32.6\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 2402141467,
                        "initialFocalLength": 45.0,
                        "focalLength": 45.0,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 6000,
                        "height": 4000,
                        "sensorWidth": 23.5,
                        "sensorHeight": 15.666666666666666,
                        "serialNumber": "/home/invisible/Downloads/photogrammetry_experiment/batch4_NIKON CORPORATION_NIKON D5300",
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
                "size": 32,
                "split": 3
            },
            "uids": {
                "0": "7c57219cadd614dc2475f7158d04fc86c0ff9b0b"
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
                "0": "3307dd9a3b8697217165cbabe05796386326927e"
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
                "size": 32,
                "split": 2
            },
            "uids": {
                "0": "18a07a48f2a19e1b7e026f4991f1d36ecc6f0c90"
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
