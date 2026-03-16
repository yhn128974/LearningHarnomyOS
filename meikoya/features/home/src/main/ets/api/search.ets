import { RequestRcp } from "basic";
import { SearchParams, SearchResult } from "../viewmodels";


export const getSearchResultAPI = (data: SearchParams) =>
RequestRcp.post<SearchResult>("/search/all", data)