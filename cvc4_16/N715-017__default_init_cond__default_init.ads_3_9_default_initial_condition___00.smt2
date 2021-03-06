(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__default_init__rec__f natural)))))
(define-fun us_split_fields_rec__default_init__rec__f__projection ((a us_split_fields)) natural 
  (rec__default_init__rec__f a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__default_init__rec__f (us_split_fields1 a))) 
                   (to_rep (rec__default_init__rec__f (us_split_fields1 b))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const default_init__rec__f__first__bit Int)

(declare-const default_init__rec__f__last__bit Int)

(declare-const default_init__rec__f__position Int)

;; default_init__rec__f__first__bit_axiom
  (assert (<= 0 default_init__rec__f__first__bit))

;; default_init__rec__f__last__bit_axiom
  (assert
  (< default_init__rec__f__first__bit default_init__rec__f__last__bit))

;; default_init__rec__f__position_axiom
  (assert (<= 0 default_init__rec__f__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((rec____ref 0))
(((rec____refqtmk (rec____content us_rep)))))
(define-fun rec____ref_rec____content__projection ((a rec____ref)) us_rep 
  (rec____content a))

(declare-fun rec_ok (us_rep) Bool)

(declare-fun rec_ok__function_guard (Bool us_rep) Bool)

;; temp___result_178'def
  (assert
  (forall ((temp___177 us_rep)) (rec_ok__function_guard (rec_ok temp___177)
  temp___177)))

(define-fun default_initial_assumption ((temp___expr_175 us_rep)
  (temp___skip_top_level_176 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__default_init__rec__f
                                            (us_split_fields1
                                            temp___expr_175))) 0)
                                         (=>
                                         (not
                                         (= temp___skip_top_level_176 true))
                                         (= (rec_ok temp___expr_175) true))))

;; rec_ok__post_axiom
  (assert true)

;; rec_ok__def_axiom
  (assert
  (forall ((x us_rep))
  (! (= (= (rec_ok x) true)
     (= (to_rep (rec__default_init__rec__f (us_split_fields1 x))) 0)) :pattern (
  (rec_ok x)) )))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(assert
;; defqtvc
 ;; File "/home/kanig/dev/spark2014/benchmark_script/data/tmp-test-N715-017__default_init_cond-15469/src/gnatprove/default_init__rec.mlw", line 340, characters 5-8
  (not
  (forall ((usf natural))
  (=> (forall ((usf1 us_rep)) (rec_ok__function_guard (rec_ok usf1) usf1))
  (=> (= (to_rep usf) 0)
  (=> (forall ((usf1 us_rep)) (rec_ok__function_guard (rec_ok usf1) usf1))
  (= (rec_ok (us_repqtmk (us_split_fieldsqtmk usf))) true)))))))
(check-sat)
(exit)
