;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-fun id (Int) Int)

(declare-fun id__function_guard (Int Int) Bool)

;; id__post_axiom
  (assert (forall ((x Int)) (! (in_range1 (id x)) :pattern ((id x)) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__test_record_cnt_ex__nested_3__complex__b Bool)))))
(define-fun us_split_discrs_rec__test_record_cnt_ex__nested_3__complex__b__projection ((a us_split_discrs)) Bool 
  (rec__test_record_cnt_ex__nested_3__complex__b a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__test_record_cnt_ex__nested_3__complex__g integer)(rec__test_record_cnt_ex__nested_3__complex__f integer)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__test_record_cnt_ex__nested_3__complex__g__projection ((a us_split_fields)) integer 
  (rec__test_record_cnt_ex__nested_3__complex__g a))

(define-fun us_split_fields_rec__test_record_cnt_ex__nested_3__complex__f__projection ((a us_split_fields)) integer 
  (rec__test_record_cnt_ex__nested_3__complex__f a))

(define-fun us_split_fields_rec__ext____6__projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__6__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__6__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__6__projection ((a us_rep)) Int (attr__tag a))

(define-fun test_record_cnt_ex__nested_3__complex__f__pred ((a us_rep)) Bool (= (ite 
  (rec__test_record_cnt_ex__nested_3__complex__b (us_split_discrs1 a)) 1 0) 1))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__test_record_cnt_ex__nested_3__complex__b
                                (us_split_discrs1 a)) 1 0) (ite (rec__test_record_cnt_ex__nested_3__complex__b
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (and
                        (= (to_rep
                           (rec__test_record_cnt_ex__nested_3__complex__g
                           (us_split_fields1 a))) (to_rep
                                                  (rec__test_record_cnt_ex__nested_3__complex__g
                                                  (us_split_fields1 b))))
                        (=> (test_record_cnt_ex__nested_3__complex__f__pred
                        a)
                        (= (to_rep
                           (rec__test_record_cnt_ex__nested_3__complex__f
                           (us_split_fields1 a))) (to_rep
                                                  (rec__test_record_cnt_ex__nested_3__complex__f
                                                  (us_split_fields1 b)))))))
                   true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const test_record_cnt_ex__nested_3__complex__b__first__bit Int)

(declare-const test_record_cnt_ex__nested_3__complex__b__last__bit Int)

(declare-const test_record_cnt_ex__nested_3__complex__b__position Int)

;; test_record_cnt_ex__nested_3__complex__b__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__b__first__bit))

;; test_record_cnt_ex__nested_3__complex__b__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__b__first__bit test_record_cnt_ex__nested_3__complex__b__last__bit))

;; test_record_cnt_ex__nested_3__complex__b__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__b__position))

(declare-const test_record_cnt_ex__nested_3__complex__g__first__bit Int)

(declare-const test_record_cnt_ex__nested_3__complex__g__last__bit Int)

(declare-const test_record_cnt_ex__nested_3__complex__g__position Int)

;; test_record_cnt_ex__nested_3__complex__g__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__g__first__bit))

;; test_record_cnt_ex__nested_3__complex__g__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__g__first__bit test_record_cnt_ex__nested_3__complex__g__last__bit))

;; test_record_cnt_ex__nested_3__complex__g__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__g__position))

(declare-const test_record_cnt_ex__nested_3__complex__f__first__bit Int)

(declare-const test_record_cnt_ex__nested_3__complex__f__last__bit Int)

(declare-const test_record_cnt_ex__nested_3__complex__f__position Int)

;; test_record_cnt_ex__nested_3__complex__f__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__f__first__bit))

;; test_record_cnt_ex__nested_3__complex__f__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__f__first__bit test_record_cnt_ex__nested_3__complex__f__last__bit))

;; test_record_cnt_ex__nested_3__complex__f__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__f__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((complex__ref 0))
(((complex__refqtmk (complex__content us_rep)))))
(define-fun complex__ref_complex__content__projection ((a complex__ref)) us_rep 
  (complex__content a))

(declare-const us_tag1 Int)

(define-fun in_range2 ((rec__test_record_cnt_ex__nested_3__complex__b1 Bool)
  (a us_rep)) Bool (= rec__test_record_cnt_ex__nested_3__complex__b1 
  (rec__test_record_cnt_ex__nested_3__complex__b (us_split_discrs1 a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const test_record_cnt_ex__nested_3__complex__b__first__bit1 Int)

(declare-const test_record_cnt_ex__nested_3__complex__b__last__bit1 Int)

(declare-const test_record_cnt_ex__nested_3__complex__b__position1 Int)

;; test_record_cnt_ex__nested_3__complex__b__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__b__first__bit1))

;; test_record_cnt_ex__nested_3__complex__b__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__b__first__bit1 test_record_cnt_ex__nested_3__complex__b__last__bit1))

;; test_record_cnt_ex__nested_3__complex__b__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__b__position1))

(declare-const test_record_cnt_ex__nested_3__complex__f__first__bit1 Int)

(declare-const test_record_cnt_ex__nested_3__complex__f__last__bit1 Int)

(declare-const test_record_cnt_ex__nested_3__complex__f__position1 Int)

;; test_record_cnt_ex__nested_3__complex__f__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__f__first__bit1))

;; test_record_cnt_ex__nested_3__complex__f__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__f__first__bit1 test_record_cnt_ex__nested_3__complex__f__last__bit1))

;; test_record_cnt_ex__nested_3__complex__f__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__f__position1))

(declare-const test_record_cnt_ex__nested_3__complex__g__first__bit1 Int)

(declare-const test_record_cnt_ex__nested_3__complex__g__last__bit1 Int)

(declare-const test_record_cnt_ex__nested_3__complex__g__position1 Int)

;; test_record_cnt_ex__nested_3__complex__g__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__g__first__bit1))

;; test_record_cnt_ex__nested_3__complex__g__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__g__first__bit1 test_record_cnt_ex__nested_3__complex__g__last__bit1))

;; test_record_cnt_ex__nested_3__complex__g__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__g__position1))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((no_f__ref 0))
(((no_f__refqtmk (no_f__content us_rep)))))
(define-fun no_f__ref_no_f__content__projection ((a no_f__ref)) us_rep 
  (no_f__content a))

(declare-const x us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const us_tag2 Int)

(define-fun in_range3 ((rec__test_record_cnt_ex__nested_3__complex__b1 Bool)
  (a us_rep)) Bool (= rec__test_record_cnt_ex__nested_3__complex__b1 
  (rec__test_record_cnt_ex__nested_3__complex__b (us_split_discrs1 a))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const test_record_cnt_ex__nested_3__complex__b__first__bit2 Int)

(declare-const test_record_cnt_ex__nested_3__complex__b__last__bit2 Int)

(declare-const test_record_cnt_ex__nested_3__complex__b__position2 Int)

;; test_record_cnt_ex__nested_3__complex__b__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__b__first__bit2))

;; test_record_cnt_ex__nested_3__complex__b__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__b__first__bit2 test_record_cnt_ex__nested_3__complex__b__last__bit2))

;; test_record_cnt_ex__nested_3__complex__b__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__b__position2))

(declare-const test_record_cnt_ex__nested_3__complex__g__first__bit2 Int)

(declare-const test_record_cnt_ex__nested_3__complex__g__last__bit2 Int)

(declare-const test_record_cnt_ex__nested_3__complex__g__position2 Int)

;; test_record_cnt_ex__nested_3__complex__g__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__g__first__bit2))

;; test_record_cnt_ex__nested_3__complex__g__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__g__first__bit2 test_record_cnt_ex__nested_3__complex__g__last__bit2))

;; test_record_cnt_ex__nested_3__complex__g__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__g__position2))

(declare-const test_record_cnt_ex__nested_3__complex__f__first__bit2 Int)

(declare-const test_record_cnt_ex__nested_3__complex__f__last__bit2 Int)

(declare-const test_record_cnt_ex__nested_3__complex__f__position2 Int)

;; test_record_cnt_ex__nested_3__complex__f__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__f__first__bit2))

;; test_record_cnt_ex__nested_3__complex__f__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__f__first__bit2 test_record_cnt_ex__nested_3__complex__f__last__bit2))

;; test_record_cnt_ex__nested_3__complex__f__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__f__position2))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((f_present__ref 0))
(((f_present__refqtmk (f_present__content us_rep)))))
(define-fun f_present__ref_f_present__content__projection ((a f_present__ref)) us_rep 
  (f_present__content a))

(declare-const w us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const z us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_invariant1 ((temp___expr_211 us_rep)
  (temp___is_init_207 Bool) (temp___skip_constant_208 Bool)
  (temp___do_toplevel_209 Bool)
  (temp___do_typ_inv_210 Bool)) Bool (=>
                                     (not (= temp___skip_constant_208 true))
                                     (in_range2 (distinct 0 0)
                                     temp___expr_211)))

(define-fun default_initial_assumption ((temp___expr_213 us_rep)
  (temp___skip_top_level_214 Bool)) Bool (and
                                         (= (attr__tag temp___expr_213) 
                                         us_tag1)
                                         (= (rec__test_record_cnt_ex__nested_3__complex__b
                                            (us_split_discrs1
                                            temp___expr_213)) (distinct 0 0))))

(define-fun dynamic_invariant2 ((temp___expr_222 us_rep)
  (temp___is_init_218 Bool) (temp___skip_constant_219 Bool)
  (temp___do_toplevel_220 Bool)
  (temp___do_typ_inv_221 Bool)) Bool (=>
                                     (not (= temp___skip_constant_219 true))
                                     (in_range3 (distinct 1 0)
                                     temp___expr_222)))

(define-fun default_initial_assumption1 ((temp___expr_224 us_rep)
  (temp___skip_top_level_225 Bool)) Bool (and
                                         (= (attr__tag temp___expr_224) 
                                         us_tag2)
                                         (= (rec__test_record_cnt_ex__nested_3__complex__b
                                            (us_split_discrs1
                                            temp___expr_224)) (distinct 1 0))))

(declare-const us_tag3 Int)

(define-fun in_range4 ((rec__test_record_cnt_ex__nested_3__complex__b1 Bool)
  (a us_rep)) Bool (= rec__test_record_cnt_ex__nested_3__complex__b1 
  (rec__test_record_cnt_ex__nested_3__complex__b (us_split_discrs1 a))))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const test_record_cnt_ex__nested_3__complex__b__first__bit3 Int)

(declare-const test_record_cnt_ex__nested_3__complex__b__last__bit3 Int)

(declare-const test_record_cnt_ex__nested_3__complex__b__position3 Int)

;; test_record_cnt_ex__nested_3__complex__b__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__b__first__bit3))

;; test_record_cnt_ex__nested_3__complex__b__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__b__first__bit3 test_record_cnt_ex__nested_3__complex__b__last__bit3))

;; test_record_cnt_ex__nested_3__complex__b__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__b__position3))

(declare-const test_record_cnt_ex__nested_3__complex__f__first__bit3 Int)

(declare-const test_record_cnt_ex__nested_3__complex__f__last__bit3 Int)

(declare-const test_record_cnt_ex__nested_3__complex__f__position3 Int)

;; test_record_cnt_ex__nested_3__complex__f__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__f__first__bit3))

;; test_record_cnt_ex__nested_3__complex__f__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__f__first__bit3 test_record_cnt_ex__nested_3__complex__f__last__bit3))

;; test_record_cnt_ex__nested_3__complex__f__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__f__position3))

(declare-const test_record_cnt_ex__nested_3__complex__g__first__bit3 Int)

(declare-const test_record_cnt_ex__nested_3__complex__g__last__bit3 Int)

(declare-const test_record_cnt_ex__nested_3__complex__g__position3 Int)

;; test_record_cnt_ex__nested_3__complex__g__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__g__first__bit3))

;; test_record_cnt_ex__nested_3__complex__g__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__g__first__bit3 test_record_cnt_ex__nested_3__complex__g__last__bit3))

;; test_record_cnt_ex__nested_3__complex__g__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__g__position3))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((t3s__ref 0))
(((t3s__refqtmk (t3s__content us_rep)))))
(define-fun t3s__ref_t3s__content__projection ((a t3s__ref)) us_rep (t3s__content
                                                                    a))

(declare-const us_tag4 Int)

(define-fun in_range5 ((rec__test_record_cnt_ex__nested_3__complex__b1 Bool)
  (a us_rep)) Bool (= rec__test_record_cnt_ex__nested_3__complex__b1 
  (rec__test_record_cnt_ex__nested_3__complex__b (us_split_discrs1 a))))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const test_record_cnt_ex__nested_3__complex__b__first__bit4 Int)

(declare-const test_record_cnt_ex__nested_3__complex__b__last__bit4 Int)

(declare-const test_record_cnt_ex__nested_3__complex__b__position4 Int)

;; test_record_cnt_ex__nested_3__complex__b__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__b__first__bit4))

;; test_record_cnt_ex__nested_3__complex__b__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__b__first__bit4 test_record_cnt_ex__nested_3__complex__b__last__bit4))

;; test_record_cnt_ex__nested_3__complex__b__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__b__position4))

(declare-const test_record_cnt_ex__nested_3__complex__f__first__bit4 Int)

(declare-const test_record_cnt_ex__nested_3__complex__f__last__bit4 Int)

(declare-const test_record_cnt_ex__nested_3__complex__f__position4 Int)

;; test_record_cnt_ex__nested_3__complex__f__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__f__first__bit4))

;; test_record_cnt_ex__nested_3__complex__f__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__f__first__bit4 test_record_cnt_ex__nested_3__complex__f__last__bit4))

;; test_record_cnt_ex__nested_3__complex__f__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__f__position4))

(declare-const test_record_cnt_ex__nested_3__complex__g__first__bit4 Int)

(declare-const test_record_cnt_ex__nested_3__complex__g__last__bit4 Int)

(declare-const test_record_cnt_ex__nested_3__complex__g__position4 Int)

;; test_record_cnt_ex__nested_3__complex__g__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__g__first__bit4))

;; test_record_cnt_ex__nested_3__complex__g__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__g__first__bit4 test_record_cnt_ex__nested_3__complex__g__last__bit4))

;; test_record_cnt_ex__nested_3__complex__g__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__g__position4))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((t4s__ref 0))
(((t4s__refqtmk (t4s__content us_rep)))))
(define-fun t4s__ref_t4s__content__projection ((a t4s__ref)) us_rep (t4s__content
                                                                    a))

(declare-const us_tag5 Int)

(define-fun in_range6 ((rec__test_record_cnt_ex__nested_3__complex__b1 Bool)
  (a us_rep)) Bool (= rec__test_record_cnt_ex__nested_3__complex__b1 
  (rec__test_record_cnt_ex__nested_3__complex__b (us_split_discrs1 a))))

(declare-const value__size5 Int)

(declare-const object__size5 Int)

(declare-const alignment5 Int)

;; value__size_axiom
  (assert (<= 0 value__size5))

;; object__size_axiom
  (assert (<= 0 object__size5))

;; alignment_axiom
  (assert (<= 0 alignment5))

(declare-const test_record_cnt_ex__nested_3__complex__b__first__bit5 Int)

(declare-const test_record_cnt_ex__nested_3__complex__b__last__bit5 Int)

(declare-const test_record_cnt_ex__nested_3__complex__b__position5 Int)

;; test_record_cnt_ex__nested_3__complex__b__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__b__first__bit5))

;; test_record_cnt_ex__nested_3__complex__b__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__b__first__bit5 test_record_cnt_ex__nested_3__complex__b__last__bit5))

;; test_record_cnt_ex__nested_3__complex__b__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__b__position5))

(declare-const test_record_cnt_ex__nested_3__complex__g__first__bit5 Int)

(declare-const test_record_cnt_ex__nested_3__complex__g__last__bit5 Int)

(declare-const test_record_cnt_ex__nested_3__complex__g__position5 Int)

;; test_record_cnt_ex__nested_3__complex__g__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__g__first__bit5))

;; test_record_cnt_ex__nested_3__complex__g__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__g__first__bit5 test_record_cnt_ex__nested_3__complex__g__last__bit5))

;; test_record_cnt_ex__nested_3__complex__g__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__g__position5))

(declare-const test_record_cnt_ex__nested_3__complex__f__first__bit5 Int)

(declare-const test_record_cnt_ex__nested_3__complex__f__last__bit5 Int)

(declare-const test_record_cnt_ex__nested_3__complex__f__position5 Int)

;; test_record_cnt_ex__nested_3__complex__f__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__f__first__bit5))

;; test_record_cnt_ex__nested_3__complex__f__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__f__first__bit5 test_record_cnt_ex__nested_3__complex__f__last__bit5))

;; test_record_cnt_ex__nested_3__complex__f__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__f__position5))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ((t5s__ref 0))
(((t5s__refqtmk (t5s__content us_rep)))))
(define-fun t5s__ref_t5s__content__projection ((a t5s__ref)) us_rep (t5s__content
                                                                    a))

(declare-const us_tag6 Int)

(define-fun in_range7 ((rec__test_record_cnt_ex__nested_3__complex__b1 Bool)
  (a us_rep)) Bool (= rec__test_record_cnt_ex__nested_3__complex__b1 
  (rec__test_record_cnt_ex__nested_3__complex__b (us_split_discrs1 a))))

(declare-const value__size6 Int)

(declare-const object__size6 Int)

(declare-const alignment6 Int)

;; value__size_axiom
  (assert (<= 0 value__size6))

;; object__size_axiom
  (assert (<= 0 object__size6))

;; alignment_axiom
  (assert (<= 0 alignment6))

(declare-const test_record_cnt_ex__nested_3__complex__b__first__bit6 Int)

(declare-const test_record_cnt_ex__nested_3__complex__b__last__bit6 Int)

(declare-const test_record_cnt_ex__nested_3__complex__b__position6 Int)

;; test_record_cnt_ex__nested_3__complex__b__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__b__first__bit6))

;; test_record_cnt_ex__nested_3__complex__b__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__b__first__bit6 test_record_cnt_ex__nested_3__complex__b__last__bit6))

;; test_record_cnt_ex__nested_3__complex__b__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__b__position6))

(declare-const test_record_cnt_ex__nested_3__complex__g__first__bit6 Int)

(declare-const test_record_cnt_ex__nested_3__complex__g__last__bit6 Int)

(declare-const test_record_cnt_ex__nested_3__complex__g__position6 Int)

;; test_record_cnt_ex__nested_3__complex__g__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__g__first__bit6))

;; test_record_cnt_ex__nested_3__complex__g__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__g__first__bit6 test_record_cnt_ex__nested_3__complex__g__last__bit6))

;; test_record_cnt_ex__nested_3__complex__g__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__g__position6))

(declare-const test_record_cnt_ex__nested_3__complex__f__first__bit6 Int)

(declare-const test_record_cnt_ex__nested_3__complex__f__last__bit6 Int)

(declare-const test_record_cnt_ex__nested_3__complex__f__position6 Int)

;; test_record_cnt_ex__nested_3__complex__f__first__bit_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__f__first__bit6))

;; test_record_cnt_ex__nested_3__complex__f__last__bit_axiom
  (assert
  (< test_record_cnt_ex__nested_3__complex__f__first__bit6 test_record_cnt_ex__nested_3__complex__f__last__bit6))

;; test_record_cnt_ex__nested_3__complex__f__position_axiom
  (assert (<= 0 test_record_cnt_ex__nested_3__complex__f__position6))

(declare-fun user_eq7 (us_rep us_rep) Bool)

(declare-const dummy7 us_rep)

(declare-datatypes ((t6s__ref 0))
(((t6s__refqtmk (t6s__content us_rep)))))
(define-fun t6s__ref_t6s__content__projection ((a t6s__ref)) us_rep (t6s__content
                                                                    a))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 7))

;; x__def_axiom
  (assert
  (= x (us_repqtmk (us_split_discrsqtmk (distinct 0 0))
       (us_split_fieldsqtmk rliteral dummy us_null_ext__) us_tag3)))

;; y__def_axiom
  (assert
  (and (id__function_guard (id 7) 7)
  (= y (us_repqtmk (us_split_discrsqtmk (distinct 0 0))
       (us_split_fieldsqtmk (of_rep (id 7)) dummy us_null_ext__) us_tag4))))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) 3))

(declare-const rliteral2 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral2) 6))

;; w__def_axiom
  (assert
  (= w (us_repqtmk (us_split_discrsqtmk (distinct 1 0))
       (us_split_fieldsqtmk rliteral1 rliteral2 us_null_ext__) us_tag5)))

;; z__def_axiom
  (assert
  (and (id__function_guard (id 6) 6)
  (= z (us_repqtmk (us_split_discrsqtmk (distinct 1 0))
       (us_split_fieldsqtmk rliteral1 (of_rep (id 6)) us_null_ext__) 
       us_tag6))))

(assert
;; defqtvc
 ;; File "test_record_cnt_ex.ads", line 55, characters 0-0
  (not (in_range 0)))
(check-sat)