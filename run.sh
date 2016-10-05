#!/usr/bin/python

import glob
import hashlib
import os
import unittest


class TestHash(unittest.TestCase):
    def test(self):
        self.maxDiff = None
        exceptions = []
        for ifile in glob.glob("image_files/*"):
            with open(ifile, 'rb') as ifileh:
                sha1 = hashlib.sha1(ifileh.read()).hexdigest()
            fname = os.path.splitext(os.path.basename(ifile))[0]
            if sha1 != fname:
                msg = '{} SHA1 does not match filename {}'.format(sha1, ifile)
                exceptions.append(ValueError(msg))
        self.assertEqual([], exceptions)


if __name__ == '__main__':
    unittest.main()
