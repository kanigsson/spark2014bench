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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

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
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort enum 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (enum enum) Bool)

(declare-const dummy1 enum)

(declare-datatypes ((enum__ref 0))
(((enum__refqtmk (enum__content enum)))))
(define-fun enum__ref_enum__content__projection ((a enum__ref)) enum 
  (enum__content a))

(declare-fun to_rep1 (enum) Int)

(declare-fun of_rep1 (Int) enum)

;; inversion_axiom
  (assert
  (forall ((x enum)) (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x enum)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__p_init__t__e enum)))))
(define-fun us_split_discrs_rec__p_init__t__e__projection ((a us_split_discrs)) enum 
  (rec__p_init__t__e a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__p_init__t__x1 integer)(rec__p_init__t__x2 integer)))))
(define-fun us_split_fields_rec__p_init__t__x1__projection ((a us_split_fields)) integer 
  (rec__p_init__t__x1 a))

(define-fun us_split_fields_rec__p_init__t__x2__projection ((a us_split_fields)) integer 
  (rec__p_init__t__x2 a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun p_init__t__x2__pred ((a us_rep)) Bool (= (to_rep1
                                                     (rec__p_init__t__e
                                                     (us_split_discrs1 a))) 1))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1 (rec__p_init__t__e (us_split_discrs1 a))) 
                        (to_rep1 (rec__p_init__t__e (us_split_discrs1 b))))
                        (and
                        (= (to_rep (rec__p_init__t__x1 (us_split_fields1 a))) 
                        (to_rep (rec__p_init__t__x1 (us_split_fields1 b))))
                        (=> (p_init__t__x2__pred a)
                        (= (to_rep (rec__p_init__t__x2 (us_split_fields1 a))) 
                        (to_rep (rec__p_init__t__x2 (us_split_fields1 b)))))))
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

(declare-const p_init__t__e__first__bit Int)

(declare-const p_init__t__e__last__bit Int)

(declare-const p_init__t__e__position Int)

;; p_init__t__e__first__bit_axiom
  (assert (<= 0 p_init__t__e__first__bit))

;; p_init__t__e__last__bit_axiom
  (assert (< p_init__t__e__first__bit p_init__t__e__last__bit))

;; p_init__t__e__position_axiom
  (assert (<= 0 p_init__t__e__position))

(declare-const p_init__t__x2__first__bit Int)

(declare-const p_init__t__x2__last__bit Int)

(declare-const p_init__t__x2__position Int)

;; p_init__t__x2__first__bit_axiom
  (assert (<= 0 p_init__t__x2__first__bit))

;; p_init__t__x2__last__bit_axiom
  (assert (< p_init__t__x2__first__bit p_init__t__x2__last__bit))

;; p_init__t__x2__position_axiom
  (assert (<= 0 p_init__t__x2__position))

(declare-const p_init__t__x1__first__bit Int)

(declare-const p_init__t__x1__last__bit Int)

(declare-const p_init__t__x1__position Int)

;; p_init__t__x1__first__bit_axiom
  (assert (<= 0 p_init__t__x1__first__bit))

;; p_init__t__x1__last__bit_axiom
  (assert (< p_init__t__x1__first__bit p_init__t__x1__last__bit))

;; p_init__t__x1__position_axiom
  (assert (<= 0 p_init__t__x1__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((tc1S__ref 0))
(((tc1S__refqtmk (tc1S__content us_rep)))))
(define-fun tc1S__ref_tc1S__content__projection ((a tc1S__ref)) us_rep 
  (tc1S__content a))

(declare-const c1 us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const p_init__t__e__first__bit1 Int)

(declare-const p_init__t__e__last__bit1 Int)

(declare-const p_init__t__e__position1 Int)

;; p_init__t__e__first__bit_axiom
  (assert (<= 0 p_init__t__e__first__bit1))

;; p_init__t__e__last__bit_axiom
  (assert (< p_init__t__e__first__bit1 p_init__t__e__last__bit1))

;; p_init__t__e__position_axiom
  (assert (<= 0 p_init__t__e__position1))

(declare-const p_init__t__x1__first__bit1 Int)

(declare-const p_init__t__x1__last__bit1 Int)

(declare-const p_init__t__x1__position1 Int)

;; p_init__t__x1__first__bit_axiom
  (assert (<= 0 p_init__t__x1__first__bit1))

;; p_init__t__x1__last__bit_axiom
  (assert (< p_init__t__x1__first__bit1 p_init__t__x1__last__bit1))

;; p_init__t__x1__position_axiom
  (assert (<= 0 p_init__t__x1__position1))

(declare-const p_init__t__x2__first__bit1 Int)

(declare-const p_init__t__x2__last__bit1 Int)

(declare-const p_init__t__x2__position1 Int)

;; p_init__t__x2__first__bit_axiom
  (assert (<= 0 p_init__t__x2__first__bit1))

;; p_init__t__x2__last__bit_axiom
  (assert (< p_init__t__x2__first__bit1 p_init__t__x2__last__bit1))

;; p_init__t__x2__position_axiom
  (assert (<= 0 p_init__t__x2__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((tc2S__ref 0))
(((tc2S__refqtmk (tc2S__content us_rep)))))
(define-fun tc2S__ref_tc2S__content__projection ((a tc2S__ref)) us_rep 
  (tc2S__content a))

(declare-const c2 us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun in_range2 ((rec__p_init__t__e1 Int)
  (a us_split_discrs)) Bool (= rec__p_init__t__e1 (to_rep1
                                                  (rec__p_init__t__e a))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const p_init__t__e__first__bit2 Int)

(declare-const p_init__t__e__last__bit2 Int)

(declare-const p_init__t__e__position2 Int)

;; p_init__t__e__first__bit_axiom
  (assert (<= 0 p_init__t__e__first__bit2))

;; p_init__t__e__last__bit_axiom
  (assert (< p_init__t__e__first__bit2 p_init__t__e__last__bit2))

;; p_init__t__e__position_axiom
  (assert (<= 0 p_init__t__e__position2))

(declare-const p_init__t__x1__first__bit2 Int)

(declare-const p_init__t__x1__last__bit2 Int)

(declare-const p_init__t__x1__position2 Int)

;; p_init__t__x1__first__bit_axiom
  (assert (<= 0 p_init__t__x1__first__bit2))

;; p_init__t__x1__last__bit_axiom
  (assert (< p_init__t__x1__first__bit2 p_init__t__x1__last__bit2))

;; p_init__t__x1__position_axiom
  (assert (<= 0 p_init__t__x1__position2))

(declare-const p_init__t__x2__first__bit2 Int)

(declare-const p_init__t__x2__last__bit2 Int)

(declare-const p_init__t__x2__position2 Int)

;; p_init__t__x2__first__bit_axiom
  (assert (<= 0 p_init__t__x2__first__bit2))

;; p_init__t__x2__last__bit_axiom
  (assert (< p_init__t__x2__first__bit2 p_init__t__x2__last__bit2))

;; p_init__t__x2__position_axiom
  (assert (<= 0 p_init__t__x2__position2))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-const y1__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun default_initial_assumption ((temp___expr_172 us_rep)
  (temp___skip_top_level_173 Bool)) Bool (= (to_rep1
                                            (rec__p_init__t__e
                                            (us_split_discrs1
                                            temp___expr_172))) 0))

(declare-const y2__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const p_init__t__e__first__bit3 Int)

(declare-const p_init__t__e__last__bit3 Int)

(declare-const p_init__t__e__position3 Int)

;; p_init__t__e__first__bit_axiom
  (assert (<= 0 p_init__t__e__first__bit3))

;; p_init__t__e__last__bit_axiom
  (assert (< p_init__t__e__first__bit3 p_init__t__e__last__bit3))

;; p_init__t__e__position_axiom
  (assert (<= 0 p_init__t__e__position3))

(declare-const p_init__t__x2__first__bit3 Int)

(declare-const p_init__t__x2__last__bit3 Int)

(declare-const p_init__t__x2__position3 Int)

;; p_init__t__x2__first__bit_axiom
  (assert (<= 0 p_init__t__x2__first__bit3))

;; p_init__t__x2__last__bit_axiom
  (assert (< p_init__t__x2__first__bit3 p_init__t__x2__last__bit3))

;; p_init__t__x2__position_axiom
  (assert (<= 0 p_init__t__x2__position3))

(declare-const p_init__t__x1__first__bit3 Int)

(declare-const p_init__t__x1__last__bit3 Int)

(declare-const p_init__t__x1__position3 Int)

;; p_init__t__x1__first__bit_axiom
  (assert (<= 0 p_init__t__x1__first__bit3))

;; p_init__t__x1__last__bit_axiom
  (assert (< p_init__t__x1__first__bit3 p_init__t__x1__last__bit3))

;; p_init__t__x1__position_axiom
  (assert (<= 0 p_init__t__x1__position3))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((tz1S__ref 0))
(((tz1S__refqtmk (tz1S__content us_rep)))))
(define-fun tz1S__ref_tz1S__content__projection ((a tz1S__ref)) us_rep 
  (tz1S__content a))

(declare-const z1__split_discrs us_split_discrs)

(declare-const z1__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant ((temp___expr_203 us_rep)
  (temp___is_init_199 Bool) (temp___skip_constant_200 Bool)
  (temp___do_toplevel_201 Bool)
  (temp___do_typ_inv_202 Bool)) Bool (=>
                                     (not (= temp___skip_constant_200 true))
                                     (in_range2 0
                                     (us_split_discrs1 temp___expr_203))))

(define-fun default_initial_assumption1 ((temp___expr_205 us_rep)
  (temp___skip_top_level_206 Bool)) Bool (= (to_rep1
                                            (rec__p_init__t__e
                                            (us_split_discrs1
                                            temp___expr_205))) 0))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const p_init__t__e__first__bit4 Int)

(declare-const p_init__t__e__last__bit4 Int)

(declare-const p_init__t__e__position4 Int)

;; p_init__t__e__first__bit_axiom
  (assert (<= 0 p_init__t__e__first__bit4))

;; p_init__t__e__last__bit_axiom
  (assert (< p_init__t__e__first__bit4 p_init__t__e__last__bit4))

;; p_init__t__e__position_axiom
  (assert (<= 0 p_init__t__e__position4))

(declare-const p_init__t__x1__first__bit4 Int)

(declare-const p_init__t__x1__last__bit4 Int)

(declare-const p_init__t__x1__position4 Int)

;; p_init__t__x1__first__bit_axiom
  (assert (<= 0 p_init__t__x1__first__bit4))

;; p_init__t__x1__last__bit_axiom
  (assert (< p_init__t__x1__first__bit4 p_init__t__x1__last__bit4))

;; p_init__t__x1__position_axiom
  (assert (<= 0 p_init__t__x1__position4))

(declare-const p_init__t__x2__first__bit4 Int)

(declare-const p_init__t__x2__last__bit4 Int)

(declare-const p_init__t__x2__position4 Int)

;; p_init__t__x2__first__bit_axiom
  (assert (<= 0 p_init__t__x2__first__bit4))

;; p_init__t__x2__last__bit_axiom
  (assert (< p_init__t__x2__first__bit4 p_init__t__x2__last__bit4))

;; p_init__t__x2__position_axiom
  (assert (<= 0 p_init__t__x2__position4))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ((tz2S__ref 0))
(((tz2S__refqtmk (tz2S__content us_rep)))))
(define-fun tz2S__ref_tz2S__content__projection ((a tz2S__ref)) us_rep 
  (tz2S__content a))

(declare-const z2__split_discrs us_split_discrs)

(declare-const z2__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(define-fun dynamic_invariant1 ((temp___expr_214 us_rep)
  (temp___is_init_210 Bool) (temp___skip_constant_211 Bool)
  (temp___do_toplevel_212 Bool)
  (temp___do_typ_inv_213 Bool)) Bool (=>
                                     (not (= temp___skip_constant_211 true))
                                     (in_range2 1
                                     (us_split_discrs1 temp___expr_214))))

(define-fun default_initial_assumption2 ((temp___expr_216 us_rep)
  (temp___skip_top_level_217 Bool)) Bool (= (to_rep1
                                            (rec__p_init__t__e
                                            (us_split_discrs1
                                            temp___expr_216))) 1))

(define-fun dynamic_invariant2 ((temp___expr_181 us_rep)
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=>
                                     (not (= temp___skip_constant_178 true))
                                     (in_range2 0
                                     (us_split_discrs1 temp___expr_181))))

(define-fun default_initial_assumption3 ((temp___expr_183 us_rep)
  (temp___skip_top_level_184 Bool)) Bool (= (to_rep1
                                            (rec__p_init__t__e
                                            (us_split_discrs1
                                            temp___expr_183))) 0))

(declare-const value__size5 Int)

(declare-const object__size5 Int)

(declare-const alignment5 Int)

;; value__size_axiom
  (assert (<= 0 value__size5))

;; object__size_axiom
  (assert (<= 0 object__size5))

;; alignment_axiom
  (assert (<= 0 alignment5))

(declare-const p_init__t__e__first__bit5 Int)

(declare-const p_init__t__e__last__bit5 Int)

(declare-const p_init__t__e__position5 Int)

;; p_init__t__e__first__bit_axiom
  (assert (<= 0 p_init__t__e__first__bit5))

;; p_init__t__e__last__bit_axiom
  (assert (< p_init__t__e__first__bit5 p_init__t__e__last__bit5))

;; p_init__t__e__position_axiom
  (assert (<= 0 p_init__t__e__position5))

(declare-const p_init__t__x2__first__bit5 Int)

(declare-const p_init__t__x2__last__bit5 Int)

(declare-const p_init__t__x2__position5 Int)

;; p_init__t__x2__first__bit_axiom
  (assert (<= 0 p_init__t__x2__first__bit5))

;; p_init__t__x2__last__bit_axiom
  (assert (< p_init__t__x2__first__bit5 p_init__t__x2__last__bit5))

;; p_init__t__x2__position_axiom
  (assert (<= 0 p_init__t__x2__position5))

(declare-const p_init__t__x1__first__bit5 Int)

(declare-const p_init__t__x1__last__bit5 Int)

(declare-const p_init__t__x1__position5 Int)

;; p_init__t__x1__first__bit_axiom
  (assert (<= 0 p_init__t__x1__first__bit5))

;; p_init__t__x1__last__bit_axiom
  (assert (< p_init__t__x1__first__bit5 p_init__t__x1__last__bit5))

;; p_init__t__x1__position_axiom
  (assert (<= 0 p_init__t__x1__position5))

(declare-fun user_eq7 (us_rep us_rep) Bool)

(declare-const dummy7 us_rep)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content us_rep)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) us_rep (t1b__content
                                                                    a))

(define-fun dynamic_invariant3 ((temp___expr_192 us_rep)
  (temp___is_init_188 Bool) (temp___skip_constant_189 Bool)
  (temp___do_toplevel_190 Bool)
  (temp___do_typ_inv_191 Bool)) Bool (=>
                                     (not (= temp___skip_constant_189 true))
                                     (in_range2 1
                                     (us_split_discrs1 temp___expr_192))))

(define-fun default_initial_assumption4 ((temp___expr_194 us_rep)
  (temp___skip_top_level_195 Bool)) Bool (= (to_rep1
                                            (rec__p_init__t__e
                                            (us_split_discrs1
                                            temp___expr_194))) 1))

(declare-const value__size6 Int)

(declare-const object__size6 Int)

(declare-const alignment6 Int)

;; value__size_axiom
  (assert (<= 0 value__size6))

;; object__size_axiom
  (assert (<= 0 object__size6))

;; alignment_axiom
  (assert (<= 0 alignment6))

(declare-const p_init__t__e__first__bit6 Int)

(declare-const p_init__t__e__last__bit6 Int)

(declare-const p_init__t__e__position6 Int)

;; p_init__t__e__first__bit_axiom
  (assert (<= 0 p_init__t__e__first__bit6))

;; p_init__t__e__last__bit_axiom
  (assert (< p_init__t__e__first__bit6 p_init__t__e__last__bit6))

;; p_init__t__e__position_axiom
  (assert (<= 0 p_init__t__e__position6))

(declare-const p_init__t__x1__first__bit6 Int)

(declare-const p_init__t__x1__last__bit6 Int)

(declare-const p_init__t__x1__position6 Int)

;; p_init__t__x1__first__bit_axiom
  (assert (<= 0 p_init__t__x1__first__bit6))

;; p_init__t__x1__last__bit_axiom
  (assert (< p_init__t__x1__first__bit6 p_init__t__x1__last__bit6))

;; p_init__t__x1__position_axiom
  (assert (<= 0 p_init__t__x1__position6))

(declare-const p_init__t__x2__first__bit6 Int)

(declare-const p_init__t__x2__last__bit6 Int)

(declare-const p_init__t__x2__position6 Int)

;; p_init__t__x2__first__bit_axiom
  (assert (<= 0 p_init__t__x2__first__bit6))

;; p_init__t__x2__last__bit_axiom
  (assert (< p_init__t__x2__first__bit6 p_init__t__x2__last__bit6))

;; p_init__t__x2__position_axiom
  (assert (<= 0 p_init__t__x2__position6))

(declare-fun user_eq8 (us_rep us_rep) Bool)

(declare-const dummy8 us_rep)

(declare-datatypes ((t2b__ref 0))
(((t2b__refqtmk (t2b__content us_rep)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) us_rep (t2b__content
                                                                    a))

(define-fun dynamic_invariant4 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 1))

;; c1__def_axiom
  (assert
  (= c1 (us_repqtmk (us_split_discrsqtmk (of_rep1 0))
        (us_split_fieldsqtmk rliteral dummy))))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) 2))

;; c2__def_axiom
  (assert
  (= c2 (us_repqtmk (us_split_discrsqtmk (of_rep1 1))
        (us_split_fieldsqtmk rliteral rliteral1))))

(define-fun dynamic_invariant5 ((temp___expr_163 Int)
  (temp___is_init_159 Bool) (temp___skip_constant_160 Bool)
  (temp___do_toplevel_161 Bool)
  (temp___do_typ_inv_162 Bool)) Bool (=>
                                     (or (= temp___is_init_159 true)
                                     (<= 0 1)) (in_range1 temp___expr_163)))

(assert
;; defqtvc
 ;; File "run.ads", line 1, characters 0-0
  (not (in_range1 0)))
(check-sat)
(exit)
