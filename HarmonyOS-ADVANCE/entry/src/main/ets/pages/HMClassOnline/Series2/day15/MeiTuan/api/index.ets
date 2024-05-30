
import axios, { AxiosResponse } from '@ohos/axios'
import { promptAction } from '@kit.ArkUI';


export const CategoryInfoList = async () => {
  try {
    const response: AxiosResponse = await axios.get<object, AxiosResponse<object>, null>('https://zhousg.atomgit.net/harmonyos-next/takeaway.json');

    return response.data
  }
  catch (error) {
    console.error(JSON.stringify(error));
  }
}