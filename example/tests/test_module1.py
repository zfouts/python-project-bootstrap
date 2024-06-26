# example/tests/test_module1.py

import unittest
from example.module1 import hello

class TestModule1(unittest.TestCase):
    def test_hello(self):
        self.assertEqual(hello(), "Hello from module1")

if __name__ == "__main__":
    unittest.main()
