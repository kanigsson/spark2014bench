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

(declare-sort s2 0)

(declare-fun s2qtint (s2) Int)

;; s2'axiom
  (assert (forall ((i s2)) (and (<= 1 (s2qtint i)) (<= (s2qtint i) 10))))

(define-fun in_range ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (s2 s2) Bool)

(declare-const dummy s2)

(declare-datatypes ((s2__ref 0))
(((s2__refqtmk (s2__content s2)))))
(define-fun s2__ref_s2__content__projection ((a s2__ref)) s2 (s2__content a))

(declare-sort colour 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (colour colour) Bool)

(declare-const dummy1 colour)

(declare-datatypes ((colour__ref 0))
(((colour__refqtmk (colour__content colour)))))
(define-fun colour__ref_colour__content__projection ((a colour__ref)) colour 
  (colour__content a))

(define-fun to_rep ((x s2)) Int (s2qtint x))

(declare-fun of_rep (Int) s2)

;; inversion_axiom
  (assert
  (forall ((x s2)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert (forall ((x s2)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-fun to_rep1 (colour) Int)

(declare-fun of_rep1 (Int) colour)

;; inversion_axiom
  (assert
  (forall ((x colour))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x colour)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort s1 0)

(declare-fun s1qtint (s1) Int)

;; s1'axiom
  (assert (forall ((i s1)) (and (<= 1 (s1qtint i)) (<= (s1qtint i) 10))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (s1 s1) Bool)

(declare-const dummy2 s1)

(declare-datatypes ((s1__ref 0))
(((s1__refqtmk (s1__content s1)))))
(define-fun s1__ref_s1__content__projection ((a s1__ref)) s1 (s1__content a))

(define-fun to_rep2 ((x s1)) Int (s1qtint x))

(declare-fun of_rep2 (Int) s1)

;; inversion_axiom
  (assert
  (forall ((x s1)) (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x s1)) (! (in_range2 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__q__t5__f1 s2)(rec__q__t5__f2 colour)(rec__q__t5__f3 s1)))))
(define-fun us_split_fields_rec__q__t5__f1__projection ((a us_split_fields)) s2 
  (rec__q__t5__f1 a))

(define-fun us_split_fields_rec__q__t5__f2__projection ((a us_split_fields)) colour 
  (rec__q__t5__f2 a))

(define-fun us_split_fields_rec__q__t5__f3__projection ((a us_split_fields)) s1 
  (rec__q__t5__f3 a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep (rec__q__t5__f1 (us_split_fields1 a))) 
                        (to_rep (rec__q__t5__f1 (us_split_fields1 b))))
                        (= (to_rep1 (rec__q__t5__f2 (us_split_fields1 a))) 
                        (to_rep1 (rec__q__t5__f2 (us_split_fields1 b)))))
                        (= (to_rep2 (rec__q__t5__f3 (us_split_fields1 a))) 
                        (to_rep2 (rec__q__t5__f3 (us_split_fields1 b)))))
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

(declare-const q__t5__f1__first__bit Int)

(declare-const q__t5__f1__last__bit Int)

(declare-const q__t5__f1__position Int)

;; q__t5__f1__first__bit_axiom
  (assert (<= 0 q__t5__f1__first__bit))

;; q__t5__f1__last__bit_axiom
  (assert (< q__t5__f1__first__bit q__t5__f1__last__bit))

;; q__t5__f1__position_axiom
  (assert (<= 0 q__t5__f1__position))

(declare-const q__t5__f2__first__bit Int)

(declare-const q__t5__f2__last__bit Int)

(declare-const q__t5__f2__position Int)

;; q__t5__f2__first__bit_axiom
  (assert (<= 0 q__t5__f2__first__bit))

;; q__t5__f2__last__bit_axiom
  (assert (< q__t5__f2__first__bit q__t5__f2__last__bit))

;; q__t5__f2__position_axiom
  (assert (<= 0 q__t5__f2__position))

(declare-const q__t5__f3__first__bit Int)

(declare-const q__t5__f3__last__bit Int)

(declare-const q__t5__f3__position Int)

;; q__t5__f3__first__bit_axiom
  (assert (<= 0 q__t5__f3__first__bit))

;; q__t5__f3__last__bit_axiom
  (assert (< q__t5__f3__first__bit q__t5__f3__last__bit))

;; q__t5__f3__position_axiom
  (assert (<= 0 q__t5__f3__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((t5__ref 0))
(((t5__refqtmk (t5__content us_rep)))))
(define-fun t5__ref_t5__content__projection ((a t5__ref)) us_rep (t5__content
                                                                 a))

(define-fun default_initial_assumption ((temp___expr_228 us_rep)
  (temp___skip_top_level_229 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__q__t5__f1
                                            (us_split_fields1
                                            temp___expr_228))) 3)
                                         (= (to_rep1
                                            (rec__q__t5__f2
                                            (us_split_fields1
                                            temp___expr_228))) 1)))

(define-fun dynamic_invariant ((temp___expr_220 Int)
  (temp___is_init_216 Bool) (temp___skip_constant_217 Bool)
  (temp___do_toplevel_218 Bool)
  (temp___do_typ_inv_219 Bool)) Bool (=>
                                     (or (= temp___is_init_216 true)
                                     (<= 1 10)) (in_range2 temp___expr_220)))

(define-fun dynamic_invariant1 ((temp___expr_206 Int)
  (temp___is_init_202 Bool) (temp___skip_constant_203 Bool)
  (temp___do_toplevel_204 Bool)
  (temp___do_typ_inv_205 Bool)) Bool (=>
                                     (or (= temp___is_init_202 true)
                                     (<= 1 10)) (in_range temp___expr_206)))

(define-fun dynamic_invariant2 ((temp___expr_213 Int)
  (temp___is_init_209 Bool) (temp___skip_constant_210 Bool)
  (temp___do_toplevel_211 Bool)
  (temp___do_typ_inv_212 Bool)) Bool (=>
                                     (or (= temp___is_init_209 true)
                                     (<= 0 2)) (in_range1 temp___expr_213)))

(assert
;; defqtvc
 ;; File "/home/kanig/dev/spark2014/benchmark_script/data/tmp-test-N122-049__default_initial_condition-31581/src/gnatprove/q__t5.mlw", line 560, characters 5-8
  (not (in_range 3)))
(check-sat)
(exit)
