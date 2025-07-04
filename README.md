# arXiv Search MCP Server

[![PyPI version](https://badge.fury.io/py/arxiv-search-mcp-server.svg)](https://badge.fury.io/py/arxiv-search-mcp-server)
[![Python Support](https://img.shields.io/pypi/pyversions/arxiv-search-mcp-server.svg)](https://pypi.org/project/arxiv-search-mcp-server/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

An MCP (Model Context Protocol) server that provides search functionality for arXiv.org papers using the official arXiv API.

## Features

- **Search by terms**: Search papers by keywords in titles, abstracts, and content
- **Subject filtering**: Filter results by arXiv subject categories (physics, cs, math, etc.)
- **Date range filtering**: Filter papers by submission date range
- **Configurable results**: Control the number of results returned (max 2000)
- **PDF URLs included**: Direct links to paper PDFs for easy access
- **Comprehensive metadata**: Author names, abstracts, categories, publication dates, and more

## Installation

### From PyPI (Recommended)

```bash
pip install arxiv-search-mcp-server
```

### From Source

1. Clone the repository:
```bash
git clone https://github.com/gavinHuang/arxiv-search-mcp.git
cd arxiv-search-mcp
```

2. Install the package:
```bash
pip install -e .
```

## Usage

### Running the Server

#### As a CLI command (after pip install)
```bash
arxiv-search-mcp
```

#### As a Python module
```bash
python -m arxiv_search_mcp.server
```

#### From source
```bash
python src/arxiv_search_mcp/server.py
```

### Available Tools

#### 1. `search_arxiv_papers`

Search for papers on arXiv with various filtering options.

**Parameters:**
- `terms` (required): Search terms to look for in paper titles, abstracts, and content
- `subject` (optional): Subject category to filter by (see available categories below)
- `start_date` (optional): Start date for filtering papers in YYYY-MM-DD format
- `end_date` (optional): End date for filtering papers in YYYY-MM-DD format  
- `max_results` (optional): Maximum number of results to return (default: 10, max: 2000)

**Example:**
```python
search_arxiv_papers(
    terms="quantum computing",
    subject="quant-ph",
    start_date="2023-01-01",
    end_date="2023-12-31",
    max_results=20
)
```

#### 2. `get_subject_categories`

Get a list of available subject categories for filtering.

**Returns:** Dictionary of category codes and their descriptions.

### Available Subject Categories

- `physics` - Physics (general)
- `astro-ph` - Astrophysics
- `cond-mat` - Condensed Matter Physics
- `gr-qc` - General Relativity and Quantum Cosmology
- `hep-ex` - High Energy Physics - Experiment
- `hep-lat` - High Energy Physics - Lattice
- `hep-ph` - High Energy Physics - Phenomenology
- `hep-th` - High Energy Physics - Theory
- `math-ph` - Mathematical Physics
- `nlin` - Nonlinear Sciences
- `nucl-ex` - Nuclear Experiment
- `nucl-th` - Nuclear Theory
- `quant-ph` - Quantum Physics
- `math` - Mathematics
- `cs` - Computer Science
- `econ` - Economics
- `eess` - Electrical Engineering and Systems Science
- `stat` - Statistics
- `q-bio` - Quantitative Biology
- `q-fin` - Quantitative Finance

## Response Format

Search results include the following information for each paper:

```json
{
  "arxiv_id": "2301.12345",
  "title": "Paper Title",
  "authors": ["Author 1", "Author 2"],
  "abstract": "Paper abstract...",
  "categories": ["cs.LG", "cs.AI"],
  "published_date": "2023-01-15",
  "pdf_url": "http://arxiv.org/pdf/2301.12345v1",
  "arxiv_url": "http://arxiv.org/abs/2301.12345",
  "comment": "Author comments",
  "journal_ref": "Journal reference if available",
  "doi": "DOI if available"
}
```

## API Limits

- Maximum 2000 results per request (arXiv API limitation)
- Rate limiting: Please be respectful with API calls (arXiv recommends 3-second delays between requests for bulk operations)
- Results are returned by relevance by default

## Error Handling

The server handles various error conditions:
- Invalid search parameters
- Network connectivity issues
- arXiv API errors
- Malformed responses

Errors are returned in a structured format with descriptive messages.

## Dependencies

- `fastmcp` - MCP server framework
- `requests` - HTTP client for arXiv API calls
- `feedparser` - Atom/RSS feed parsing
- `urllib3` - URL handling utilities

## License

This project follows the arXiv API Terms of Use. Please respect arXiv's resources and use the API responsibly.
