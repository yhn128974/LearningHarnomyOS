import { HDMUser, RequestRcp } from "basic";
import { LoginFormModel } from "../viewmodels";

export const loginAPI = (data: LoginFormModel) =>
RequestRcp.post<HDMUser>("/login", data)