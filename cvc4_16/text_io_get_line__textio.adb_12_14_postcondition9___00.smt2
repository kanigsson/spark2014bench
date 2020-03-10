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

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun div1 (Int Int) Int)

(declare-fun mod1 (Int Int) Int)

;; Div_mod
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (= x (+ (* y (div1 x y)) (mod1 x y))))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div1 x y)) (<= (div1 x y) x)))))

;; Mod_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0))
  (and (< (- (abs1 y)) (mod1 x y)) (< (mod1 x y) (abs1 y))))))

;; Div_sign_pos
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< 0 y)) (<= 0 (div1 x y)))))

;; Div_sign_neg
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= x 0) (< 0 y)) (<= (div1 x y) 0))))

;; Mod_sign_pos
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (not (= y 0))) (<= 0 (mod1 x y)))))

;; Mod_sign_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= x 0) (not (= y 0))) (<= (mod1 x y) 0))))

;; Rounds_toward_zero
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (<= (abs1 (* (div1 x y) y)) (abs1 x)))))

;; Div_1
  (assert (forall ((x Int)) (= (div1 x 1) x)))

;; Mod_1
  (assert (forall ((x Int)) (= (mod1 x 1) 0)))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div1 x y) 0))))

;; Mod_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (mod1 x y) x))))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (div1 (+ (* x y) z) x) (+ y (div1 z x)))) :pattern ((div1
                                                            (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (mod1 (+ (* x y) z) x) (mod1 z x))) :pattern ((mod1 (+ (* x y) z) x)) )))

;; Div_unique
  (assert
  (forall ((x Int) (y Int) (q Int))
  (=> (< 0 y) (=> (and (<= (* q y) x) (< x (+ (* q y) y))) (= (div x y) q)))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div x y)) (<= (div x y) x)))))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div x y) 0))))

;; Div_inf_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (< 0 x) (<= x y)) (= (div (- x) y) (- 1)))))

;; Mod_0
  (assert (forall ((y Int)) (=> (not (= y 0)) (= (mod 0 y) 0))))

;; Div_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div 1 y) 0))))

;; Div_minus1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div (- 1) y) (- 1)))))

;; Mod_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (mod 1 y) 1))))

;; Mod_minus1_left
  (assert
  (forall ((y Int))
  (! (=> (< 1 y) (= (mod (- 1) y) (- y 1))) :pattern ((mod (- 1) y)) )))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (div (+ (* x y) z) x) (+ y (div z x)))) :pattern ((div (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (mod (+ (* x y) z) x) (mod z x))) :pattern ((mod (+ (* x y) z) x)) )))

(define-fun mod2 ((x Int)
  (y Int)) Int (ite (< 0 y) (mod x y) (+ (mod x y) y)))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (positive positive) Bool)

(declare-const dummy positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range
                                    temp___expr_46)))

(declare-sort character 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (character character) Bool)

(declare-const dummy1 character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(define-fun dynamic_invariant1 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range1 temp___expr_74)))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep (select a temp___idx_91)) (to_rep
                                                                (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep (select a temp___idx_91)) (to_rep
                                       (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(define-fun in_range2 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Bool)

(declare-sort file_descr 0)

(declare-fun file_descrqtint (file_descr) Int)

;; file_descr'axiom
  (assert
  (forall ((i file_descr))
  (and (<= (- 2147483648) (file_descrqtint i))
  (<= (file_descrqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (file_descr file_descr) Bool)

(declare-const dummy2 file_descr)

(declare-datatypes ((file_descr__ref 0))
(((file_descr__refqtmk (file_descr__content file_descr)))))
(define-fun file_descr__ref_file_descr__content__projection ((a file_descr__ref)) file_descr 
  (file_descr__content a))

(define-fun to_rep1 ((x file_descr)) Int (file_descrqtint x))

(declare-fun of_rep1 (Int) file_descr)

;; inversion_axiom
  (assert
  (forall ((x file_descr))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x file_descr)) (! (in_range3
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort count 0)

(declare-fun countqtint (count) Int)

;; count'axiom
  (assert
  (forall ((i count))
  (and (<= 0 (countqtint i)) (<= (countqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (count count) Bool)

(declare-const dummy3 count)

(declare-datatypes ((count__ref 0))
(((count__refqtmk (count__content count)))))
(define-fun count__ref_count__content__projection ((a count__ref)) count 
  (count__content a))

(define-fun to_rep2 ((x count)) Int (countqtint x))

(declare-fun of_rep2 (Int) count)

;; inversion_axiom
  (assert
  (forall ((x count))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x count)) (! (in_range4 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__textio__file_type__descr file_descr)(rec__textio__file_type__before_lm Bool)(rec__textio__file_type__before_lm_pm Bool)(rec__textio__file_type__col count)(rec__textio__file_type__line count)(rec__textio__file_type__page count)(rec__textio__file_type__is_regular_file Bool)))))
(define-fun us_split_fields_rec__textio__file_type__descr__projection ((a us_split_fields)) file_descr 
  (rec__textio__file_type__descr a))

(define-fun us_split_fields_rec__textio__file_type__before_lm__projection ((a us_split_fields)) Bool 
  (rec__textio__file_type__before_lm a))

(define-fun us_split_fields_rec__textio__file_type__before_lm_pm__projection ((a us_split_fields)) Bool 
  (rec__textio__file_type__before_lm_pm a))

(define-fun us_split_fields_rec__textio__file_type__col__projection ((a us_split_fields)) count 
  (rec__textio__file_type__col a))

(define-fun us_split_fields_rec__textio__file_type__line__projection ((a us_split_fields)) count 
  (rec__textio__file_type__line a))

(define-fun us_split_fields_rec__textio__file_type__page__projection ((a us_split_fields)) count 
  (rec__textio__file_type__page a))

(define-fun us_split_fields_rec__textio__file_type__is_regular_file__projection ((a us_split_fields)) Bool 
  (rec__textio__file_type__is_regular_file a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep1
                           (rec__textio__file_type__descr
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__textio__file_type__descr
                                                  (us_split_fields1 b))))
                        (= (ite (rec__textio__file_type__before_lm
                                (us_split_fields1 a)) 1 0) (ite (rec__textio__file_type__before_lm
                                                                (us_split_fields1
                                                                b)) 1 0)))
                        (and
                        (and
                        (and
                        (= (ite (rec__textio__file_type__before_lm_pm
                                (us_split_fields1 a)) 1 0) (ite (rec__textio__file_type__before_lm_pm
                                                                (us_split_fields1
                                                                b)) 1 0))
                        (= (to_rep2
                           (rec__textio__file_type__col (us_split_fields1 a))) 
                        (to_rep2
                        (rec__textio__file_type__col (us_split_fields1 b)))))
                        (= (to_rep2
                           (rec__textio__file_type__line
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__textio__file_type__line
                                                  (us_split_fields1 b)))))
                        (and
                        (= (to_rep2
                           (rec__textio__file_type__page
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__textio__file_type__page
                                                  (us_split_fields1 b))))
                        (= (ite (rec__textio__file_type__is_regular_file
                                (us_split_fields1 a)) 1 0) (ite (rec__textio__file_type__is_regular_file
                                                                (us_split_fields1
                                                                b)) 1 0)))))
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

(declare-const textio__file_type__descr__first__bit Int)

(declare-const textio__file_type__descr__last__bit Int)

(declare-const textio__file_type__descr__position Int)

;; textio__file_type__descr__first__bit_axiom
  (assert (<= 0 textio__file_type__descr__first__bit))

;; textio__file_type__descr__last__bit_axiom
  (assert
  (< textio__file_type__descr__first__bit textio__file_type__descr__last__bit))

;; textio__file_type__descr__position_axiom
  (assert (<= 0 textio__file_type__descr__position))

(declare-const textio__file_type__before_lm__first__bit Int)

(declare-const textio__file_type__before_lm__last__bit Int)

(declare-const textio__file_type__before_lm__position Int)

;; textio__file_type__before_lm__first__bit_axiom
  (assert (<= 0 textio__file_type__before_lm__first__bit))

;; textio__file_type__before_lm__last__bit_axiom
  (assert
  (< textio__file_type__before_lm__first__bit textio__file_type__before_lm__last__bit))

;; textio__file_type__before_lm__position_axiom
  (assert (<= 0 textio__file_type__before_lm__position))

(declare-const textio__file_type__before_lm_pm__first__bit Int)

(declare-const textio__file_type__before_lm_pm__last__bit Int)

(declare-const textio__file_type__before_lm_pm__position Int)

;; textio__file_type__before_lm_pm__first__bit_axiom
  (assert (<= 0 textio__file_type__before_lm_pm__first__bit))

;; textio__file_type__before_lm_pm__last__bit_axiom
  (assert
  (< textio__file_type__before_lm_pm__first__bit textio__file_type__before_lm_pm__last__bit))

;; textio__file_type__before_lm_pm__position_axiom
  (assert (<= 0 textio__file_type__before_lm_pm__position))

(declare-const textio__file_type__col__first__bit Int)

(declare-const textio__file_type__col__last__bit Int)

(declare-const textio__file_type__col__position Int)

;; textio__file_type__col__first__bit_axiom
  (assert (<= 0 textio__file_type__col__first__bit))

;; textio__file_type__col__last__bit_axiom
  (assert
  (< textio__file_type__col__first__bit textio__file_type__col__last__bit))

;; textio__file_type__col__position_axiom
  (assert (<= 0 textio__file_type__col__position))

(declare-const textio__file_type__line__first__bit Int)

(declare-const textio__file_type__line__last__bit Int)

(declare-const textio__file_type__line__position Int)

;; textio__file_type__line__first__bit_axiom
  (assert (<= 0 textio__file_type__line__first__bit))

;; textio__file_type__line__last__bit_axiom
  (assert
  (< textio__file_type__line__first__bit textio__file_type__line__last__bit))

;; textio__file_type__line__position_axiom
  (assert (<= 0 textio__file_type__line__position))

(declare-const textio__file_type__page__first__bit Int)

(declare-const textio__file_type__page__last__bit Int)

(declare-const textio__file_type__page__position Int)

;; textio__file_type__page__first__bit_axiom
  (assert (<= 0 textio__file_type__page__first__bit))

;; textio__file_type__page__last__bit_axiom
  (assert
  (< textio__file_type__page__first__bit textio__file_type__page__last__bit))

;; textio__file_type__page__position_axiom
  (assert (<= 0 textio__file_type__page__position))

(declare-const textio__file_type__is_regular_file__first__bit Int)

(declare-const textio__file_type__is_regular_file__last__bit Int)

(declare-const textio__file_type__is_regular_file__position Int)

;; textio__file_type__is_regular_file__first__bit_axiom
  (assert (<= 0 textio__file_type__is_regular_file__first__bit))

;; textio__file_type__is_regular_file__last__bit_axiom
  (assert
  (< textio__file_type__is_regular_file__first__bit textio__file_type__is_regular_file__last__bit))

;; textio__file_type__is_regular_file__position_axiom
  (assert (<= 0 textio__file_type__is_regular_file__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((file_type__ref 0))
(((file_type__refqtmk (file_type__content us_rep)))))
(define-fun file_type__ref_file_type__content__projection ((a file_type__ref)) us_rep 
  (file_type__content a))

(declare-const eof Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const eof_ch Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const file us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-sort int__ 0)

(declare-fun int__qtint (int__) Int)

;; int__'axiom
  (assert
  (forall ((i int__))
  (and (<= (- 2147483648) (int__qtint i)) (<= (int__qtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (int__ int__) Bool)

(declare-const dummy5 int__)

(declare-datatypes ((int____ref 0))
(((int____refqtmk (int____content int__)))))
(define-fun int____ref_int____content__2__projection ((a int____ref)) int__ 
  (int____content a))

(define-fun dynamic_invariant2 ((temp___expr_207 Int)
  (temp___is_init_203 Bool) (temp___skip_constant_204 Bool)
  (temp___do_toplevel_205 Bool)
  (temp___do_typ_inv_206 Bool)) Bool (=>
                                     (or (= temp___is_init_203 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range5 temp___expr_207)))

(declare-fun ferror (Int) Int)

(declare-fun ferror__function_guard (Int Int) Bool)

(define-fun dynamic_invariant3 ((temp___expr_172 Int)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (or (= temp___is_init_168 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range3 temp___expr_172)))

;; ferror__post_axiom
  (assert
  (forall ((stream Int))
  (! (=> (dynamic_invariant3 stream true true true true) (dynamic_invariant2
     (ferror stream) true false true true)) :pattern ((ferror stream)) )))

(define-fun dynamic_invariant4 ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= 0 2147483647)) (in_range4
                                     temp___expr_179)))

;; eof_ch__def_axiom
  (assert (= eof_ch (mod2 eof 256)))

(assert
;; defqtvc
 ;; File "textio.adb", line 10, characters 0-0
  (not
  (forall ((the_file (Array Int character)) (cur_position Int) (ch Int)
  (cur_position1 Int) (cur_position2 Int) (cur_position3 Int) (ch1 Int)
  (o Bool) (spark__branch Bool))
  (=> (= cur_position1 cur_position)
  (=> (dynamic_invariant2 ch false false true true)
  (=> (dynamic_invariant cur_position true false true true)
  (=> (= cur_position2 cur_position)
  (=> (dynamic_invariant1 eof_ch true false true true)
  (=> (= (mod2 eof 256) eof_ch)
  (=> (dynamic_invariant2 eof true false true true)
  (=>
  (exists ((o1 Int))
  (= (to_rep1 (rec__textio__file_type__descr (us_split_fields1 file))) o1))
  (=>
  (ite (= (to_rep (select the_file cur_position2)) eof_ch)
  (and (= cur_position3 cur_position2) (= ch1 eof))
  (ite (= (to_rep (select the_file cur_position2)) 10)
  (and (= cur_position3 cur_position2) (= ch1 10))
  (and (= cur_position3 (+ cur_position2 1))
  (= ch1 (to_rep (select the_file cur_position2))))))
  (=> (dynamic_invariant2 ch1 true true true true)
  (=> (dynamic_invariant cur_position3 true true true true)
  (=>
  (ite (= ch1 eof)
  (exists ((o1 Int))
  (and
  (= (to_rep1 (rec__textio__file_type__descr (us_split_fields1 file))) o1)
  (let ((o2 (ferror o1)))
  (and (dynamic_invariant2 o2 true false true true)
  (= o (ite (= o2 0) false true)))))) (= o false))
  (=> (= spark__branch o)
  (=> (not (= spark__branch true))
  (=> (not (= (to_rep (select the_file cur_position1)) eof_ch))
  (=> (not (= (to_rep (select the_file cur_position1)) 10))
  (= cur_position3 (+ cur_position1 1)))))))))))))))))))))
(check-sat)
(exit)
