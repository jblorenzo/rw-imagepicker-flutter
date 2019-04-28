/*
 * Copyright (c) 2019 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'package:flutter/material.dart';
import 'package:imagepickerflutter/GalleryImage.dart';

class MultiGallerySelectPage extends StatefulWidget {
  createState() => _MultiGallerySelectPageState();
}

class _MultiGallerySelectPageState extends State<MultiGallerySelectPage> {
  final _numberOfColumns = 4;
  final _title = "Gallery";

  var _selectedItems = List<GalleryImage>();
  var _itemCache = Map<int, GalleryImage>();

  Future<GalleryImage> _getItem(int index) async {
    // TODO: fetch gallery content here
  }

  _selectItem(int index) {
    // TODO: process item selection/deselection here
  }

  // TODO: replace with actual image count
  var _numberOfItems = 5;

  void initState() {
    super.initState();

    // TODO: implement this
  }

  // TODO: Render image in card
  _buildItem(int index) => GestureDetector(
      onTap: () {
        _selectItem(index);
      },
      child: Card(
        elevation: 2.0,
        child: FutureBuilder(
            future: _getItem(index),
            builder: (context, snapshot) {
              var item = snapshot?.data;
              if (item != null) {
                return Container();
              }

              return Container();
            }),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _numberOfColumns),
          itemCount: _numberOfItems,
          itemBuilder: (context, index) {
            return _buildItem(index);
          }),
    );
  }
}
