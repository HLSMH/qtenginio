# Enginio Qt Library Tests 
Set of automated tests for Enginio Qt client library. 


# System Requirements
* Qt 5.0 or newer (Qt 5.1 recommended)
* OpenSSL library
  * Mac OS X: OpenSSL library should be preinstalled.
  * Linux: Most distributions have preinstalled OpenSSL library. If yours doesn't, seach for `libssl` in package repository.
  * Windows: Get the installer from http://slproweb.com/products/Win32OpenSSL.html (light version is enough, copy DLLs to windows system directory when asked).
* Perl 5.10 or newer
  * Mac and Linux: Perl should be preinstalled.
  * Windows: http://www.perl.org/get.html


# Get the code
* Clone the repository and Enginio library submodule `git clone --recursive ...`
* Please note that there's no need to install Enginio client library. Tests build and link to included library.


# Running tests from Qt Creator
* Open test project enginio-qt-tests.pro in Qt Creator
* Run individual tests by right-clicking test sub-projects and selecting Run.


# Running tests from command line (Linux only):
* `cd enginio-qt-tests`
* `qmake`
* `make`
* `./run-all-tests.sh`


# Contributing
* Fork the repository on [GitHub](https://github.com/enginio/enginio-qt-tests)
* Create a [feature branch](http://nvie.com/posts/a-successful-git-branching-model/) (i.e. create a branch which is named like my-cool-feature)
* Implement the new feature and automated tests for it
* Make sure all tests pass
* Submit a pull request that includes only your feature branch


# Copyright
Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
Contact http://qt.digia.com/contact-us 


# License
Enginio Qt library tests are tri-licensed under the Commercial Qt License, the GNU General Public License 3.0, and the GNU Lesser General Public License 2.1.

**Commercial License Usage**
Licensees holding valid Commercial Qt Licenses may use this test set in accordance with the commercial license agreement provided with the Software or, alternatively, in accordance with the terms contained in a written agreement between you and Digia. For licensing terms and conditions see http://qt.digia.com/licensing. For further information use the contact form at http://qt.digia.com/contact-us.

**GNU Lesser General Public License Usage**
Alternatively, this test set may be used under the terms of the GNU Lesser General Public License version 2.1 as published by the Free Software Foundation and appearing in the file LICENSE.LGPL included in the packaging of this library. Please review the following information to ensure the GNU Lesser General Public License version 2.1 requirements will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html. In addition, as a special exception, Digia gives you certain additional rights. These rights are described in the Digia Qt LGPL Exception version 1.1, included in the file LGPL_EXCEPTION.txt.

**GNU General Public License Usage**
Alternatively, this test set may be used under the terms of the GNU General Public License version 3.0 as published by the Free Software Foundation and appearing in the file LICENSE.GPL included in the packaging of this library. Please review the following information to ensure the GNU General Public License version 3.0 requirements will be met: http://www.gnu.org/copyleft/gpl.html.
