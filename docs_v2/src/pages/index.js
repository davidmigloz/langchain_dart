import { Redirect } from "@docusaurus/router";
import useBaseUrl from "@docusaurus/useBaseUrl";
import React from "react";

export default function Home() {
  return <Redirect to={useBaseUrl("/docs/intro/")} />;
}
