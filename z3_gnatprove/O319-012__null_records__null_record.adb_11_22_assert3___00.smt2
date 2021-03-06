(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-sort null_rec 0)

(declare-fun user_eq (null_rec null_rec) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const dummy null_rec)

(declare-datatypes ()
((null_rec__ref (null_rec__refqtmk (null_rec__content null_rec)))))
(define-fun null_rec__ref_null_rec__content__projection ((a null_rec__ref)) null_rec 
  (null_rec__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun user_eq1 (null_rec null_rec) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const dummy1 null_rec)

(declare-datatypes ()
((null_rec2__ref (null_rec2__refqtmk (null_rec2__content null_rec)))))
(define-fun null_rec2__ref_null_rec2__content__projection ((a null_rec2__ref)) null_rec 
  (null_rec2__content a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-datatypes ()
((us_split_fields (us_split_fieldsqtmk (rec__ext__ us_private)))))
(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq ((a us_rep) (b us_rep)) Bool (ite true true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ()
((t_null_rec__ref (t_null_rec__refqtmk (t_null_rec__content us_rep)))))
(define-fun t_null_rec__ref_t_null_rec__content__projection ((a t_null_rec__ref)) us_rep 
  (t_null_rec__content a))

(declare-const t1__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun default_initial_assumption ((temp___expr_173 us_rep)
  (temp___skip_top_level_174 Bool)) Bool (= (attr__tag temp___expr_173) 
  us_tag))

(declare-const us_tag1 Int)

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ()
((t_null_rec2__ref (t_null_rec2__refqtmk (t_null_rec2__content us_rep)))))
(define-fun t_null_rec2__ref_t_null_rec2__content__projection ((a t_null_rec2__ref)) us_rep 
  (t_null_rec2__content a))

(declare-const t2__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun default_initial_assumption1 ((temp___expr_180 us_rep)
  (temp___skip_top_level_181 Bool)) Bool (= (attr__tag temp___expr_180) 
  us_tag1))

(declare-const t3__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const o1 null_rec)

(declare-const o2 null_rec)

(declare-const t1__split_fields us_private)

(declare-const t2__split_fields us_private)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert true)

(declare-const o3 null_rec)

;; H
  (assert (= o3 o1))

;; Assume
  (assert true)

;; Assume
  (assert (default_initial_assumption
  (us_repqtmk (us_split_fieldsqtmk t1__split_fields) t1__attr__tag) false))

;; Assume
  (assert true)

;; Assume
  (assert (default_initial_assumption1
  (us_repqtmk (us_split_fieldsqtmk t2__split_fields) t2__attr__tag) false))

;; Assume
  (assert true)

(declare-const t3__split_fields us_private)

;; H
  (assert (= t3__split_fields t2__split_fields))

;; Assume
  (assert (= t3__attr__tag us_tag))

;; Assume
  (assert true)

;; Assert
  (assert true)

(assert
;; defqtvc
 ;; File "null_record.ads", line 8, characters 0-0
  (not
  (= (bool_eq
     (us_repqtmk (us_split_fieldsqtmk t1__split_fields) t1__attr__tag)
     (us_repqtmk (us_split_fieldsqtmk t3__split_fields) t3__attr__tag)) true)))
(check-sat)

(exit)
