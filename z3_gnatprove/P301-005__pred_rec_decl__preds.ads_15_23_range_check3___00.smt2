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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const i11s Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort sub_int_ok 0)

(declare-fun sub_int_okqtint (sub_int_ok) Int)

;; sub_int_ok'axiom
  (assert
  (forall ((i sub_int_ok))
  (and (<= (- 2147483648) (sub_int_okqtint i))
  (<= (sub_int_okqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (sub_int_ok sub_int_ok) Bool)

(declare-const dummy sub_int_ok)

(declare-datatypes ()
((sub_int_ok__ref (sub_int_ok__refqtmk (sub_int_ok__content sub_int_ok)))))
(define-fun sub_int_ok__ref_sub_int_ok__content__projection ((a sub_int_ok__ref)) sub_int_ok 
  (sub_int_ok__content a))

(define-fun dynamic_invariant ((temp___expr_206 Int)
  (temp___is_init_202 Bool) (temp___skip_constant_203 Bool)
  (temp___do_toplevel_204 Bool)
  (temp___do_typ_inv_205 Bool)) Bool (and
                                     (=>
                                     (or (= temp___is_init_202 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range temp___expr_206))
                                     (=> (= temp___do_toplevel_204 true)
                                     (or
                                     (and (<= (- 2147483648) temp___expr_206)
                                     (<= temp___expr_206 (- 1)))
                                     (and (<= 1 temp___expr_206)
                                     (<= temp___expr_206 2147483647))))))

(define-fun dynamic_predicate ((temp___210 Int)) Bool (or
                                                      (and
                                                      (<= (- 2147483648) temp___210)
                                                      (<= temp___210 (- 1)))
                                                      (and (<= 1 temp___210)
                                                      (<= temp___210 2147483647))))

(define-fun to_rep ((x sub_int_ok)) Int (sub_int_okqtint x))

(declare-fun of_rep (Int) sub_int_ok)

;; inversion_axiom
  (assert
  (forall ((x sub_int_ok))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x sub_int_ok)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-const x Int)

;; Assume
  (assert (dynamic_invariant i11s true false true true))

;; Assume
  (assert (dynamic_invariant i11s true false true true))

;; Assume
  (assert (dynamic_invariant x false false true true))

(assert
;; defqtvc
 ;; File "preds.ads", line 26, characters 0-0
  (not (in_range 1)))
(check-sat)
