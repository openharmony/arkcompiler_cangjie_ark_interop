/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ohos_app_cangjie_entry

internal import ohos.base.LengthProp
internal import ohos.arkui.component.Column
internal import ohos.arkui.component.Row
internal import ohos.arkui.component.Text
internal import ohos.arkui.component.CustomView
internal import ohos.arkui.component.CJEntry
internal import ohos.arkui.component.loadNativeView
internal import ohos.arkui.component.FontWeight
internal import ohos.arkui.state_management.SubscriberManager
internal import ohos.arkui.state_management.ObservedProperty
internal import ohos.arkui.state_management.LocalStorage
import ohos.state_macro_manage.Entry
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State
import ohos.state_macro_manage.r
import kit.CoreFileKit.*
import kit.AbilityKit.*
import ohos.base.*
import ohos.hilog.Hilog

func getContext(): UIAbilityContext {
    return globalContext.getOrThrow()
}

@Entry
@Component
class EntryView {
    @State
    var message: String = "Hello World"

    func build() {
        Row {
            Column {
                Text(this.message)
                    .fontSize(50)
                    .fontWeight(FontWeight.Bold)
                    .onClick {
                        evt => this.message = "Hello Cangjie"
                        createFile()
                        readWriteFile()
                        readWriteFileWithStream()
                        getListFile()
                    }
            }.width(100.percent)
        }.height(100.percent)
    }
}

func createFile(): Unit {
    // 见获取UIAbility的上下文信息章节
    let context = getContext()
    // 获取应用文件路径
    let filesDir = context.filesDir
    // 文件不存在时创建并打开文件，文件存在时打开文件
    let file = FileIo.open(filesDir + '/test.txt', mode: OpenMode.READ_WRITE | OpenMode.CREATE)
    // 写入一段内容至文件
    let writeLen = FileIo.write(file.fd, "Try to write str.")
    Hilog.info(0,"","The length of str is: ${writeLen}")
    let bufSize = 4096
    var readSize = 0
    // 创建一个大小为1024字节的Array<Byte>对象，用于存储从文件中读取的数据
    let array = Array<Byte>(1024, repeat: 0)
    // 设置读取的偏移量和长度
    let readOptions = ReadOptions(
        offset: readSize,
        length: UIntNative(bufSize)
    )
    // 读取文件内容到ArrayBuffer对象中，并返回实际读取的字节数
    let readLen = FileIo.read(file.fd, array, options: readOptions)
    Hilog.info(0,"","the content of file: ${String.fromUtf8(array[..readLen])}")
    // 关闭文件
    FileIo.close(file)
}

func readWriteFile() {
    // 见获取UIAbility的上下文信息章节
    let context = getContext()
    // 获取应用文件路径
    let filesDir = context.filesDir
    // 打开文件
    let srcFile = FileIo.open(filesDir + '/test.txt', mode: OpenMode.READ_WRITE | OpenMode.CREATE)
    let destFile = FileIo.open(filesDir + '/destFile.txt', mode: OpenMode.READ_WRITE | OpenMode.CREATE)
    // 读取源文件内容并写入至目的文件
    let bufSize = 4096
    var readSize = 0
    let buf = Array<Byte>(bufSize, repeat: 0)
    var readOptions = ReadOptions(
        offset: readSize,
        length: UIntNative(bufSize)
    )
    var readLen = FileIo.read(srcFile.fd, buf, options: readOptions)
    while (readLen > 0) {
        readSize += readLen
        let writeOptions = WriteOptions(
            length: UIntNative(readLen)
        )
        FileIo.write(destFile.fd, buf, options: writeOptions)
        readOptions.offset = readSize
        readLen = FileIo.read(srcFile.fd, buf, options: readOptions)
    }
    // 关闭文件
    FileIo.close(srcFile)
    FileIo.close(destFile)
}

func readWriteFileWithStream() {
    // 见获取UIAbility的上下文信息章节
    let context = getContext()
    // 获取应用文件路径
    let filesDir = context.filesDir
    // 创建并打开输入文件流
    let inputStream = FileIo.createStream(filesDir + '/test.txt', 'r+')
    // 创建并打开输出文件流
    let outputStream = FileIo.createStream(filesDir + '/destFile.txt', "w+")

    let bufSize = 4096
    var readSize = 0
    let buf = Array<Byte>(bufSize, repeat: 0)
    var readOptions = ReadOptions(
        offset: readSize,
        length: UIntNative(bufSize)
    )
    // 以流的形式读取源文件内容并写入到目标文件
    var readLen = inputStream.read(buf, options: readOptions)
    readSize += readLen
    while (readLen > 0) {
        outputStream.write(buf[0..readLen])
        readOptions.offset = readSize
        readLen = inputStream.read(buf, options: readOptions)
        readSize += readLen
    }
    // 关闭文件流
    inputStream.close()
    outputStream.close()
}

// 查看文件列表
func getListFile() {
    // 见获取UIAbility的上下文信息章节
    let context = getContext()
    // 获取应用文件路径
    let filesDir = context.filesDir
    let listFileOption = ListFileOptions(
        recursion: false,
        listNum: 0,
        filter: Filter(
            suffix: [".png", ".jpg", ".txt"],
            displayName: ["test*"],
            fileSizeOver: 0,
            lastModifiedAfter: 10000.0
        )
    )
    let files = FileIo.listFile(filesDir, options: listFileOption)
    for (item in files) {
        Hilog.info(0,"","The name of file: ${item}")
    }
}