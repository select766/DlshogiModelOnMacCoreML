//
//  main.swift
//  DlshogiModelOnMacCoreML
//
//  Created by Masatoshi Hidaka on 2022/05/26.
//

import Foundation
import CoreML

print("Hello, World!")

let config = MLModelConfiguration()
config.computeUnits = .all//デバイス指定(all/cpuAndGPU/cpuOnly) ここを書き換えたら速度が変わるはず
let model = try? DlShogiResnet15x224SwishBatch(configuration: config)
print("Model Loaded!", model)

// バッチサイズによっても速度が変わる
let runner = ModelRunner(model: model!, batchSize: 16, loadedModelComputeUnits: "?", duration: 60.0, updateMessage: {message in print(message)})
runner.main()

print("end")
