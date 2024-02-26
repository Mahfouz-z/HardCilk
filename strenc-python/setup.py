import setuptools

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

setuptools.setup(
    name="strenc-python",
    version="0.0.1",
    author="Canberk Sönmez",
    author_email="canberk.sonmez@epfl.ch",
    description="A simple framework for serializing objects as strings in a language-agnostic way.",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/jnbrq/strenc-python",
    project_urls={
        "Bug Tracker": "https://github.com/jnbrq/strenc-python/issues",
    },
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: Unix",
    ],
    package_dir={"": "src"},
    packages=setuptools.find_packages(where="src"),
    include_package_data=True,
    python_requires=">=3.8",
    package_data={},
    install_requires=[],
    license="MIT"
)

