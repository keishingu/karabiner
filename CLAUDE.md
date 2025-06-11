# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## リポジトリ概要

これはKarabiner-Elementsの設定リポジトリです。Karabiner-ElementsはmacOS用のキーボードカスタマイズツールで、キーの再マッピングや複雑なキー組み合わせの作成が可能です。

## 主要ファイル

- `karabiner.json`: プロファイル、デバイス設定、キーマッピングを含むメイン設定ファイル
- `automatic_backups/`: Karabiner-Elementsが自動作成する設定ファイルのバックアップ

## 設定構造

`karabiner.json`は以下の構造に従います：
- `profiles[]`: 設定プロファイルの配列
- `devices[]`: 各プロファイル内のデバイス固有設定
- `simple_modifications[]`: 基本的なキー再マッピングルール
- `virtual_hid_keyboard`: 国コードやキーボードタイプを含む仮想キーボード設定

## 現在の設定

アクティブな設定はJISキーボードレイアウトを使用し、基本的なキー再マッピングを含みます：
- 右Command → F7
- 右Shift → F6

## 設定の編集について

`karabiner.json`を変更する際は：
1. Karabiner-Elementsが自動的に`automatic_backups/`にバックアップを作成
2. ファイル保存時に変更が即座に反映
3. Karabinerドキュメントの正しいキーコードを使用し、適切なJSON形式を保持
4. 設定全体を壊さないよう段階的にテスト