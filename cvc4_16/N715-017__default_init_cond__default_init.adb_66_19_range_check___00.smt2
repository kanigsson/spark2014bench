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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

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
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-fun init (Int) Int)

(declare-fun init__function_guard (Int Int) Bool)

;; init__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (init x)))
     (=> (init__function_guard result x) (dynamic_invariant result true false
     true true)))) :pattern ((init x)) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__default_init__discr__b Bool)))))
(define-fun us_split_discrs_rec__default_init__discr__b__projection ((a us_split_discrs)) Bool 
  (rec__default_init__discr__b a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__default_init__discr__f natural)))))
(define-fun us_split_fields_rec__default_init__discr__f__projection ((a us_split_fields)) natural 
  (rec__default_init__discr__f a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__4__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__4__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun default_init__discr__f__pred ((a us_rep)) Bool (= (ite (rec__default_init__discr__b
                                                                   (us_split_discrs1
                                                                   a)) 1 0) 1))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__default_init__discr__b
                                (us_split_discrs1 a)) 1 0) (ite (rec__default_init__discr__b
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (=> (default_init__discr__f__pred a)
                        (= (to_rep
                           (rec__default_init__discr__f (us_split_fields1 a))) 
                        (to_rep
                        (rec__default_init__discr__f (us_split_fields1 b))))))
                   true false))

(define-fun in_range2 ((rec__default_init__discr__b1 Bool)
  (a us_split_discrs)) Bool (= rec__default_init__discr__b1 (rec__default_init__discr__b
                                                            a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const default_init__discr__b__first__bit Int)

(declare-const default_init__discr__b__last__bit Int)

(declare-const default_init__discr__b__position Int)

;; default_init__discr__b__first__bit_axiom
  (assert (<= 0 default_init__discr__b__first__bit))

;; default_init__discr__b__last__bit_axiom
  (assert
  (< default_init__discr__b__first__bit default_init__discr__b__last__bit))

;; default_init__discr__b__position_axiom
  (assert (<= 0 default_init__discr__b__position))

(declare-const default_init__discr__f__first__bit Int)

(declare-const default_init__discr__f__last__bit Int)

(declare-const default_init__discr__f__position Int)

;; default_init__discr__f__first__bit_axiom
  (assert (<= 0 default_init__discr__f__first__bit))

;; default_init__discr__f__last__bit_axiom
  (assert
  (< default_init__discr__f__first__bit default_init__discr__f__last__bit))

;; default_init__discr__f__position_axiom
  (assert (<= 0 default_init__discr__f__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((discr__ref 0))
(((discr__refqtmk (discr__content us_rep)))))
(define-fun discr__ref_discr__content__projection ((a discr__ref)) us_rep 
  (discr__content a))

(declare-datatypes ((us_split_discrs2 0))
(((us_split_discrsqtmk1 (rec__default_init__mut_discr__b Bool)))))
(define-fun us_split_discrs_rec__default_init__mut_discr__b__projection ((a us_split_discrs2)) Bool 
  (rec__default_init__mut_discr__b a))

(declare-datatypes ((us_split_discrs__ref1 0))
(((us_split_discrs__refqtmk1 (us_split_discrs__content1 us_split_discrs2)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref1)) us_split_discrs2 
  (us_split_discrs__content1 a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__default_init__mut_discr__f natural)))))
(define-fun us_split_fields_rec__default_init__mut_discr__f__projection ((a us_split_fields2)) natural 
  (rec__default_init__mut_discr__f a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__5__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs3 us_split_discrs2)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs2 
  (us_split_discrs3 a))

(define-fun us_rep___split_fields__5__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun default_init__mut_discr__f__pred ((a us_rep1)) Bool (= (ite 
  (rec__default_init__mut_discr__b (us_split_discrs3 a)) 1 0) 1))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (ite (rec__default_init__mut_discr__b
                                 (us_split_discrs3 a)) 1 0) (ite (rec__default_init__mut_discr__b
                                                                 (us_split_discrs3
                                                                 b)) 1 0))
                         (=> (default_init__mut_discr__f__pred a)
                         (= (to_rep
                            (rec__default_init__mut_discr__f
                            (us_split_fields3 a))) (to_rep
                                                   (rec__default_init__mut_discr__f
                                                   (us_split_fields3 b))))))
                    true false))

(define-fun in_range3 ((rec__default_init__mut_discr__b1 Bool)
  (a us_split_discrs2)) Bool (= rec__default_init__mut_discr__b1 (rec__default_init__mut_discr__b
                                                                 a)))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const default_init__mut_discr__b__first__bit Int)

(declare-const default_init__mut_discr__b__last__bit Int)

(declare-const default_init__mut_discr__b__position Int)

;; default_init__mut_discr__b__first__bit_axiom
  (assert (<= 0 default_init__mut_discr__b__first__bit))

;; default_init__mut_discr__b__last__bit_axiom
  (assert
  (< default_init__mut_discr__b__first__bit default_init__mut_discr__b__last__bit))

;; default_init__mut_discr__b__position_axiom
  (assert (<= 0 default_init__mut_discr__b__position))

(declare-const default_init__mut_discr__f__first__bit Int)

(declare-const default_init__mut_discr__f__last__bit Int)

(declare-const default_init__mut_discr__f__position Int)

;; default_init__mut_discr__f__first__bit_axiom
  (assert (<= 0 default_init__mut_discr__f__first__bit))

;; default_init__mut_discr__f__last__bit_axiom
  (assert
  (< default_init__mut_discr__f__first__bit default_init__mut_discr__f__last__bit))

;; default_init__mut_discr__f__position_axiom
  (assert (<= 0 default_init__mut_discr__f__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((mut_discr__ref 0))
(((mut_discr__refqtmk (mut_discr__content us_rep1)))))
(define-fun mut_discr__ref_mut_discr__content__projection ((a mut_discr__ref)) us_rep1 
  (mut_discr__content a))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const default_init__discr__b__first__bit1 Int)

(declare-const default_init__discr__b__last__bit1 Int)

(declare-const default_init__discr__b__position1 Int)

;; default_init__discr__b__first__bit_axiom
  (assert (<= 0 default_init__discr__b__first__bit1))

;; default_init__discr__b__last__bit_axiom
  (assert
  (< default_init__discr__b__first__bit1 default_init__discr__b__last__bit1))

;; default_init__discr__b__position_axiom
  (assert (<= 0 default_init__discr__b__position1))

(declare-const default_init__discr__f__first__bit1 Int)

(declare-const default_init__discr__f__last__bit1 Int)

(declare-const default_init__discr__f__position1 Int)

;; default_init__discr__f__first__bit_axiom
  (assert (<= 0 default_init__discr__f__first__bit1))

;; default_init__discr__f__last__bit_axiom
  (assert
  (< default_init__discr__f__first__bit1 default_init__discr__f__last__bit1))

;; default_init__discr__f__position_axiom
  (assert (<= 0 default_init__discr__f__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((td1S__ref 0))
(((td1S__refqtmk (td1S__content us_rep)))))
(define-fun td1S__ref_td1S__content__projection ((a td1S__ref)) us_rep 
  (td1S__content a))

(declare-const d1__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun discr_ok (us_rep) Bool)

(declare-fun discr_ok__function_guard (Bool us_rep) Bool)

(define-fun dynamic_invariant1 ((temp___expr_301 us_rep)
  (temp___is_init_297 Bool) (temp___skip_constant_298 Bool)
  (temp___do_toplevel_299 Bool)
  (temp___do_typ_inv_300 Bool)) Bool (=>
                                     (not (= temp___skip_constant_298 true))
                                     (in_range2 (distinct 1 0)
                                     (us_split_discrs1 temp___expr_301))))

;; temp___result_307'def
  (assert
  (forall ((temp___306 us_rep)) (discr_ok__function_guard
  (discr_ok temp___306) temp___306)))

(define-fun default_initial_assumption ((temp___expr_303 us_rep)
  (temp___skip_top_level_304 Bool)) Bool (and
                                         (and
                                         (= (rec__default_init__discr__b
                                            (us_split_discrs1
                                            temp___expr_303)) (distinct 1 0))
                                         (=> (default_init__discr__f__pred
                                         temp___expr_303)
                                         (= (to_rep
                                            (rec__default_init__discr__f
                                            (us_split_fields1
                                            temp___expr_303))) 0)))
                                         (=>
                                         (not
                                         (= temp___skip_top_level_304 true))
                                         (= (discr_ok temp___expr_303) true))))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const default_init__discr__b__first__bit2 Int)

(declare-const default_init__discr__b__last__bit2 Int)

(declare-const default_init__discr__b__position2 Int)

;; default_init__discr__b__first__bit_axiom
  (assert (<= 0 default_init__discr__b__first__bit2))

;; default_init__discr__b__last__bit_axiom
  (assert
  (< default_init__discr__b__first__bit2 default_init__discr__b__last__bit2))

;; default_init__discr__b__position_axiom
  (assert (<= 0 default_init__discr__b__position2))

(declare-const default_init__discr__f__first__bit2 Int)

(declare-const default_init__discr__f__last__bit2 Int)

(declare-const default_init__discr__f__position2 Int)

;; default_init__discr__f__first__bit_axiom
  (assert (<= 0 default_init__discr__f__first__bit2))

;; default_init__discr__f__last__bit_axiom
  (assert
  (< default_init__discr__f__first__bit2 default_init__discr__f__last__bit2))

;; default_init__discr__f__position_axiom
  (assert (<= 0 default_init__discr__f__position2))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((td2S__ref 0))
(((td2S__refqtmk (td2S__content us_rep)))))
(define-fun td2S__ref_td2S__content__projection ((a td2S__ref)) us_rep 
  (td2S__content a))

(declare-const d2__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant2 ((temp___expr_312 us_rep)
  (temp___is_init_308 Bool) (temp___skip_constant_309 Bool)
  (temp___do_toplevel_310 Bool)
  (temp___do_typ_inv_311 Bool)) Bool (=>
                                     (not (= temp___skip_constant_309 true))
                                     (in_range2 (distinct 0 0)
                                     (us_split_discrs1 temp___expr_312))))

;; temp___result_318'def
  (assert
  (forall ((temp___317 us_rep)) (discr_ok__function_guard
  (discr_ok temp___317) temp___317)))

(define-fun default_initial_assumption1 ((temp___expr_314 us_rep)
  (temp___skip_top_level_315 Bool)) Bool (and
                                         (and
                                         (= (rec__default_init__discr__b
                                            (us_split_discrs1
                                            temp___expr_314)) (distinct 0 0))
                                         (=> (default_init__discr__f__pred
                                         temp___expr_314)
                                         (= (to_rep
                                            (rec__default_init__discr__f
                                            (us_split_fields1
                                            temp___expr_314))) 0)))
                                         (=>
                                         (not
                                         (= temp___skip_top_level_315 true))
                                         (= (discr_ok temp___expr_314) true))))

(declare-const d3__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun mut_discr_ok (us_rep1) Bool)

(declare-fun mut_discr_ok__function_guard (Bool us_rep1) Bool)

;; temp___result_255'def
  (assert (init__function_guard (init 0) 0))

;; temp___result_257'def
  (assert
  (forall ((temp___256 us_rep1)) (mut_discr_ok__function_guard
  (mut_discr_ok temp___256) temp___256)))

(define-fun default_initial_assumption2 ((temp___expr_252 us_rep1)
  (temp___skip_top_level_253 Bool)) Bool (and
                                         (and
                                         (= (rec__default_init__mut_discr__b
                                            (us_split_discrs3
                                            temp___expr_252)) (distinct 0 0))
                                         (=>
                                         (default_init__mut_discr__f__pred
                                         temp___expr_252)
                                         (= (to_rep
                                            (rec__default_init__mut_discr__f
                                            (us_split_fields3
                                            temp___expr_252))) (init 0))))
                                         (=>
                                         (not
                                         (= temp___skip_top_level_253 true))
                                         (= (mut_discr_ok temp___expr_252) true))))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const default_init__mut_discr__b__first__bit1 Int)

(declare-const default_init__mut_discr__b__last__bit1 Int)

(declare-const default_init__mut_discr__b__position1 Int)

;; default_init__mut_discr__b__first__bit_axiom
  (assert (<= 0 default_init__mut_discr__b__first__bit1))

;; default_init__mut_discr__b__last__bit_axiom
  (assert
  (< default_init__mut_discr__b__first__bit1 default_init__mut_discr__b__last__bit1))

;; default_init__mut_discr__b__position_axiom
  (assert (<= 0 default_init__mut_discr__b__position1))

(declare-const default_init__mut_discr__f__first__bit1 Int)

(declare-const default_init__mut_discr__f__last__bit1 Int)

(declare-const default_init__mut_discr__f__position1 Int)

;; default_init__mut_discr__f__first__bit_axiom
  (assert (<= 0 default_init__mut_discr__f__first__bit1))

;; default_init__mut_discr__f__last__bit_axiom
  (assert
  (< default_init__mut_discr__f__first__bit1 default_init__mut_discr__f__last__bit1))

;; default_init__mut_discr__f__position_axiom
  (assert (<= 0 default_init__mut_discr__f__position1))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((td4S__ref 0))
(((td4S__refqtmk (td4S__content us_rep1)))))
(define-fun td4S__ref_td4S__content__projection ((a td4S__ref)) us_rep1 
  (td4S__content a))

(declare-const d4__split_discrs us_split_discrs2)

(declare-const d4__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_invariant3 ((temp___expr_323 us_rep1)
  (temp___is_init_319 Bool) (temp___skip_constant_320 Bool)
  (temp___do_toplevel_321 Bool)
  (temp___do_typ_inv_322 Bool)) Bool (=>
                                     (not (= temp___skip_constant_320 true))
                                     (in_range3 (distinct 0 0)
                                     (us_split_discrs3 temp___expr_323))))

;; temp___result_328'def
  (assert (init__function_guard (init 0) 0))

;; temp___result_330'def
  (assert
  (forall ((temp___329 us_rep1)) (mut_discr_ok__function_guard
  (mut_discr_ok temp___329) temp___329)))

(define-fun default_initial_assumption3 ((temp___expr_325 us_rep1)
  (temp___skip_top_level_326 Bool)) Bool (and
                                         (and
                                         (= (rec__default_init__mut_discr__b
                                            (us_split_discrs3
                                            temp___expr_325)) (distinct 0 0))
                                         (=>
                                         (default_init__mut_discr__f__pred
                                         temp___expr_325)
                                         (= (to_rep
                                            (rec__default_init__mut_discr__f
                                            (us_split_fields3
                                            temp___expr_325))) (init 0))))
                                         (=>
                                         (not
                                         (= temp___skip_top_level_326 true))
                                         (= (mut_discr_ok temp___expr_325) true))))

(declare-const value__size5 Int)

(declare-const object__size5 Int)

(declare-const alignment5 Int)

;; value__size_axiom
  (assert (<= 0 value__size5))

;; object__size_axiom
  (assert (<= 0 object__size5))

;; alignment_axiom
  (assert (<= 0 alignment5))

(declare-const default_init__mut_discr__b__first__bit2 Int)

(declare-const default_init__mut_discr__b__last__bit2 Int)

(declare-const default_init__mut_discr__b__position2 Int)

;; default_init__mut_discr__b__first__bit_axiom
  (assert (<= 0 default_init__mut_discr__b__first__bit2))

;; default_init__mut_discr__b__last__bit_axiom
  (assert
  (< default_init__mut_discr__b__first__bit2 default_init__mut_discr__b__last__bit2))

;; default_init__mut_discr__b__position_axiom
  (assert (<= 0 default_init__mut_discr__b__position2))

(declare-const default_init__mut_discr__f__first__bit2 Int)

(declare-const default_init__mut_discr__f__last__bit2 Int)

(declare-const default_init__mut_discr__f__position2 Int)

;; default_init__mut_discr__f__first__bit_axiom
  (assert (<= 0 default_init__mut_discr__f__first__bit2))

;; default_init__mut_discr__f__last__bit_axiom
  (assert
  (< default_init__mut_discr__f__first__bit2 default_init__mut_discr__f__last__bit2))

;; default_init__mut_discr__f__position_axiom
  (assert (<= 0 default_init__mut_discr__f__position2))

(declare-fun user_eq6 (us_rep1 us_rep1) Bool)

(declare-const dummy6 us_rep1)

(declare-datatypes ((td5S__ref 0))
(((td5S__refqtmk (td5S__content us_rep1)))))
(define-fun td5S__ref_td5S__content__projection ((a td5S__ref)) us_rep1 
  (td5S__content a))

(declare-const d5__split_discrs us_split_discrs2)

(declare-const d5__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant4 ((temp___expr_335 us_rep1)
  (temp___is_init_331 Bool) (temp___skip_constant_332 Bool)
  (temp___do_toplevel_333 Bool)
  (temp___do_typ_inv_334 Bool)) Bool (=>
                                     (not (= temp___skip_constant_332 true))
                                     (in_range3 (distinct 1 0)
                                     (us_split_discrs3 temp___expr_335))))

;; temp___result_340'def
  (assert (init__function_guard (init 0) 0))

;; temp___result_342'def
  (assert
  (forall ((temp___341 us_rep1)) (mut_discr_ok__function_guard
  (mut_discr_ok temp___341) temp___341)))

(define-fun default_initial_assumption4 ((temp___expr_337 us_rep1)
  (temp___skip_top_level_338 Bool)) Bool (and
                                         (and
                                         (= (rec__default_init__mut_discr__b
                                            (us_split_discrs3
                                            temp___expr_337)) (distinct 1 0))
                                         (=>
                                         (default_init__mut_discr__f__pred
                                         temp___expr_337)
                                         (= (to_rep
                                            (rec__default_init__mut_discr__f
                                            (us_split_fields3
                                            temp___expr_337))) (init 0))))
                                         (=>
                                         (not
                                         (= temp___skip_top_level_338 true))
                                         (= (mut_discr_ok temp___expr_337) true))))

;; discr_ok__post_axiom
  (assert true)

;; discr_ok__def_axiom
  (assert
  (forall ((x us_rep))
  (! (= (= (discr_ok x) true)
     (=> (= (rec__default_init__discr__b (us_split_discrs1 x)) true)
     (= (to_rep (rec__default_init__discr__f (us_split_fields1 x))) 0))) :pattern (
  (discr_ok x)) )))

;; mut_discr_ok__post_axiom
  (assert true)

;; mut_discr_ok__def_axiom
  (assert
  (forall ((x us_rep1))
  (! (= (= (mut_discr_ok x) true)
     (not (= (rec__default_init__mut_discr__b (us_split_discrs3 x)) true))) :pattern (
  (mut_discr_ok x)) )))

(assert
;; defqtvc
 ;; File "default_init.ads", line 46, characters 0-0
  (not
  (forall ((d1__split_fields natural))
  (=> (default_initial_assumption
  (us_repqtmk d1__split_discrs (us_split_fieldsqtmk d1__split_fields)) false)
  (=> (dynamic_invariant1
  (us_repqtmk d1__split_discrs (us_split_fieldsqtmk d1__split_fields)) false
  false true true) (in_range 0))))))
(check-sat)
(exit)
