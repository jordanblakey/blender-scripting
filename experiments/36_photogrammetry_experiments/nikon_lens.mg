{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.3.0",
        "fileVersion": "1.1",
        "template": false,
        "nodesVersions": {
            "StructureFromMotion": "3.3",
            "Meshing": "7.0",
            "PrepareDenseScene": "3.1",
            "FeatureMatching": "2.0",
            "ImageMatching": "2.0",
            "CameraInit": "9.0",
            "MeshFiltering": "3.0",
            "DepthMap": "5.0",
            "Texturing": "6.0",
            "FeatureExtraction": "1.3",
            "MeshDecimate": "1.0",
            "DepthMapFilter": "4.0"
        }
    },
    "graph": {
        "Texturing_1": {
            "nodeType": "Texturing",
            "position": [
                2227,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "26097d72513c50a4784f68fea85c0b86e5faf84b"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{Meshing_1.output}",
                "imagesFolder": "{DepthMap_1.imagesFolder}",
                "inputMesh": "{MeshDecimate_1.output}",
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
                "0": "4de41044d7bbbce7357384a7524ee003db9806d4"
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
                "size": 52,
                "split": 3
            },
            "uids": {
                "0": "15339cd8ecd1ee14da8a0455f61639752a50e0ba"
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
                "size": 52,
                "split": 1
            },
            "uids": {
                "0": "8b810fd7a240ea1b4a6545a316beb2dead13ca9a"
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
                "size": 52,
                "split": 2
            },
            "uids": {
                "0": "b0684c426c79623e56c9523ff8f716ad6a8a40bc"
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
                "size": 52,
                "split": 1
            },
            "uids": {
                "0": "a723e28699a938c5eee64189da6ffbcd8046c947"
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
                "size": 52,
                "split": 2
            },
            "uids": {
                "0": "7112c44629603dd78d307e58ce02af4c0c001590"
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
                "size": 52,
                "split": 1
            },
            "uids": {
                "0": "a114a9356fcefa1d340fc62abe4f51c58855abff"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 127814055,
                        "poseId": 127814055,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0254.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:53:26\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:53:26\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:53:26\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 192373304,
                        "poseId": 192373304,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0216.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:37:09\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:37:09\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:37:09\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 222069450,
                        "poseId": 222069450,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0232.JPG",
                        "intrinsicId": 4089831369,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:42:14\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:42:14\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:42:14\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"46\", \"Exif:FocalLengthIn35mmFilm\": \"69\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.8\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 223579844,
                        "poseId": 223579844,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0210.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:35:27\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:35:27\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:35:27\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 228348856,
                        "poseId": 228348856,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0227.JPG",
                        "intrinsicId": 2757348083,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:40:54\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:40:54\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:40:54\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"48\", \"Exif:FocalLengthIn35mmFilm\": \"72\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.8\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 277469729,
                        "poseId": 277469729,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0260.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:55:04\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:55:04\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:55:04\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 302111640,
                        "poseId": 302111640,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0255.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:53:43\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:53:43\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:53:43\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 384230973,
                        "poseId": 384230973,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0256.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:53:58\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:53:58\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:53:58\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 427694914,
                        "poseId": 427694914,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0229.JPG",
                        "intrinsicId": 2757348083,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:41:25\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:41:25\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:41:25\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"48\", \"Exif:FocalLengthIn35mmFilm\": \"72\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.8\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 430029291,
                        "poseId": 430029291,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0252.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:51:20\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:51:20\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:51:20\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 441015901,
                        "poseId": 441015901,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0230.JPG",
                        "intrinsicId": 4089831369,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:41:42\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:41:42\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:41:42\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"46\", \"Exif:FocalLengthIn35mmFilm\": \"69\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.8\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 449058629,
                        "poseId": 449058629,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0253.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:53:06\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:53:06\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:53:06\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 456036731,
                        "poseId": 456036731,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0217.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:37:25\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:37:25\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:37:25\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 470697047,
                        "poseId": 470697047,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0235.JPG",
                        "intrinsicId": 2757348083,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:43:04\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:43:04\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:43:04\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"48\", \"Exif:FocalLengthIn35mmFilm\": \"72\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.8\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 596404529,
                        "poseId": 596404529,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0233.JPG",
                        "intrinsicId": 4089831369,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:42:25\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:42:25\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:42:25\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"46\", \"Exif:FocalLengthIn35mmFilm\": \"69\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.8\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 610090158,
                        "poseId": 610090158,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0221.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:38:12\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:38:12\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:38:12\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"90\", \"Exif:SubsecTimeDigitized\": \"90\", \"Exif:SubsecTimeOriginal\": \"90\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 653919310,
                        "poseId": 653919310,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0250.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:50:52\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:50:52\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:50:52\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 676948945,
                        "poseId": 676948945,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0220.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:38:01\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:38:01\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:38:01\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 694953215,
                        "poseId": 694953215,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0208.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:34:51\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:34:51\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:34:51\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 782926633,
                        "poseId": 782926633,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0215.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:36:57\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:36:57\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:36:57\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 804335463,
                        "poseId": 804335463,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0211.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:36:00\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:36:00\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:36:00\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 859127082,
                        "poseId": 859127082,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0247.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:50:15\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:50:15\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:50:15\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 901442103,
                        "poseId": 901442103,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0251.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:51:08\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:51:08\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:51:08\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 904970910,
                        "poseId": 904970910,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0243.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:49:05\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:49:05\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:49:05\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 978611978,
                        "poseId": 978611978,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0223.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:38:35\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:38:35\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:38:35\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 983120268,
                        "poseId": 983120268,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0242.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:48:52\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:48:52\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:48:52\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1048210252,
                        "poseId": 1048210252,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0225.JPG",
                        "intrinsicId": 2757348083,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:40:13\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:40:13\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:40:13\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"48\", \"Exif:FocalLengthIn35mmFilm\": \"72\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.8\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1056228387,
                        "poseId": 1056228387,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0238.JPG",
                        "intrinsicId": 2757348083,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:43:50\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:43:50\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:43:50\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"48\", \"Exif:FocalLengthIn35mmFilm\": \"72\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.8\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1188715026,
                        "poseId": 1188715026,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0257.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:54:12\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:54:12\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:54:12\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1290268730,
                        "poseId": 1290268730,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0218.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:37:36\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:37:36\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:37:36\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"70\", \"Exif:SubsecTimeDigitized\": \"70\", \"Exif:SubsecTimeOriginal\": \"70\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1304142571,
                        "poseId": 1304142571,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0222.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:38:23\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:38:23\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:38:23\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1387053460,
                        "poseId": 1387053460,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0240.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:48:22\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:48:22\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:48:22\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1390724189,
                        "poseId": 1390724189,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0213.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:36:32\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:36:32\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:36:32\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1396955145,
                        "poseId": 1396955145,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0246.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:49:47\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:49:47\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:49:47\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1405517440,
                        "poseId": 1405517440,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0236.JPG",
                        "intrinsicId": 2757348083,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:43:20\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:43:20\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:43:20\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"48\", \"Exif:FocalLengthIn35mmFilm\": \"72\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.8\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1531177378,
                        "poseId": 1531177378,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0209.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:35:10\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:35:10\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:35:10\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1571056345,
                        "poseId": 1571056345,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0239.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:48:03\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:48:03\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:48:03\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1657747700,
                        "poseId": 1657747700,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0244.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:49:21\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:49:21\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:49:21\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1666310514,
                        "poseId": 1666310514,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0241.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:48:37\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:48:37\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:48:37\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1676424107,
                        "poseId": 1676424107,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0234.JPG",
                        "intrinsicId": 2757348083,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:42:49\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:42:49\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:42:49\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"48\", \"Exif:FocalLengthIn35mmFilm\": \"72\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.8\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1682231353,
                        "poseId": 1682231353,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0226.JPG",
                        "intrinsicId": 2757348083,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:40:32\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:40:32\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:40:32\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"48\", \"Exif:FocalLengthIn35mmFilm\": \"72\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.8\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1744230469,
                        "poseId": 1744230469,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0245.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:49:34\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:49:34\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:49:34\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1794107466,
                        "poseId": 1794107466,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0248.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:50:23\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:50:23\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:50:23\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1812212280,
                        "poseId": 1812212280,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0258.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:54:27\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:54:27\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:54:27\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"50\", \"Exif:SubsecTimeDigitized\": \"50\", \"Exif:SubsecTimeOriginal\": \"50\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1846407148,
                        "poseId": 1846407148,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0214.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:36:44\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:36:44\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:36:44\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1873769787,
                        "poseId": 1873769787,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0219.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:37:49\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:37:49\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:37:49\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1884051255,
                        "poseId": 1884051255,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0228.JPG",
                        "intrinsicId": 4089831369,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:41:10\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:41:10\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:41:10\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"46\", \"Exif:FocalLengthIn35mmFilm\": \"69\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.8\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"30\", \"Exif:SubsecTimeDigitized\": \"30\", \"Exif:SubsecTimeOriginal\": \"30\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1903881110,
                        "poseId": 1903881110,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0224.JPG",
                        "intrinsicId": 2757348083,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:39:53\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:39:53\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:39:53\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"48\", \"Exif:FocalLengthIn35mmFilm\": \"72\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.8\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"10\", \"Exif:SubsecTimeDigitized\": \"10\", \"Exif:SubsecTimeOriginal\": \"10\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2021939217,
                        "poseId": 2021939217,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0249.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:50:37\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:50:37\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:50:37\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"40\", \"Exif:SubsecTimeDigitized\": \"40\", \"Exif:SubsecTimeOriginal\": \"40\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2116849790,
                        "poseId": 2116849790,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0259.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:54:50\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:54:50\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:54:50\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"20\", \"Exif:SubsecTimeDigitized\": \"20\", \"Exif:SubsecTimeOriginal\": \"20\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2121518809,
                        "poseId": 2121518809,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0212.JPG",
                        "intrinsicId": 2852859036,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:36:19\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:36:19\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:36:19\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"55\", \"Exif:FocalLengthIn35mmFilm\": \"82\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"5\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"60\", \"Exif:SubsecTimeDigitized\": \"60\", \"Exif:SubsecTimeOriginal\": \"60\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2141649235,
                        "poseId": 2141649235,
                        "path": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm/DSC_0237.JPG",
                        "intrinsicId": 2757348083,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.500000\", \"DateTime\": \"2025:07:03 08:43:37\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2025:07:03 08:43:37\", \"Exif:DateTimeOriginal\": \"2025:07:03 08:43:37\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"-0.666667\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"48\", \"Exif:FocalLengthIn35mmFilm\": \"72\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"0\", \"Exif:MaxApertureValue\": \"4.8\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"6000\", \"Exif:PixelYDimension\": \"4000\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:SensitivityType\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"80\", \"Exif:SubsecTimeDigitized\": \"80\", \"Exif:SubsecTimeOriginal\": \"80\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.769231\", \"FNumber\": \"8\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:Rating\": \"0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D5300\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 2757348083,
                        "initialFocalLength": 47.99999999999999,
                        "focalLength": 47.99999999999999,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 6000,
                        "height": 4000,
                        "sensorWidth": 23.5,
                        "sensorHeight": 15.666666666666666,
                        "serialNumber": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm_NIKON CORPORATION_NIKON D5300",
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
                        "intrinsicId": 2852859036,
                        "initialFocalLength": 55.0,
                        "focalLength": 55.0,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 6000,
                        "height": 4000,
                        "sensorWidth": 23.5,
                        "sensorHeight": 15.666666666666666,
                        "serialNumber": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm_NIKON CORPORATION_NIKON D5300",
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
                        "intrinsicId": 4089831369,
                        "initialFocalLength": 46.0,
                        "focalLength": 46.0,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 6000,
                        "height": 4000,
                        "sensorWidth": 23.5,
                        "sensorHeight": 15.666666666666666,
                        "serialNumber": "/home/invisible/projects/blender-scripting/static/images/photogrammetry/nikon_afs_micro_40mm_NIKON CORPORATION_NIKON D5300",
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
                "size": 52,
                "split": 5
            },
            "uids": {
                "0": "6e60349d955e030272d2b39f2f93253357e992c1"
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
                "0": "012966f5c22c116425cde4728b89d5b2d459f7c1"
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
                "size": 52,
                "split": 3
            },
            "uids": {
                "0": "8dad5c9acaa3bef8c299780396fdb259e74cc226"
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
        },
        "MeshDecimate_1": {
            "nodeType": "MeshDecimate",
            "position": [
                2034,
                -4
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "2d09e5e89acc63f3a904aa2571d19aee0cf9a08c"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{MeshFiltering_1.outputMesh}",
                "simplificationFactor": 0.1,
                "nbVertices": 0,
                "minVertices": 0,
                "maxVertices": 0,
                "flipNormals": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/mesh.obj"
            }
        }
    }
}
