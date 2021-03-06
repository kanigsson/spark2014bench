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

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort character 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (character character) Bool)

(declare-const dummy3 character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep1 (character) Int)

(declare-fun of_rep1 (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range3
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

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
                           (= (to_rep1 (select a temp___idx_91)) (to_rep1
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
  (= (to_rep1 (select a temp___idx_91)) (to_rep1
                                        (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(define-fun to_rep2 ((x integer)) Int (integerqtint x))

(declare-fun of_rep2 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                             (of_rep2 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep2 (first (mk f l))) f) (= (to_rep2 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep2 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep2 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep2 (first (rt x)))
                 (to_rep2 (last (rt x))) (elts y) (to_rep2 (first (rt y)))
                 (to_rep2 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((string____ref 0))
(((string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(declare-const dummy5 (Array Int character))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq5 ((Array Int character) (Array Int character)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__fixed_string__object__width natural)(rec__fixed_string__object__name (Array Int character))(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__fixed_string__object__width__projection ((a us_split_fields)) natural 
  (rec__fixed_string__object__width a))

(define-fun us_split_fields_rec__fixed_string__object__name__projection ((a us_split_fields)) (Array Int character) 
  (rec__fixed_string__object__name a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__fixed_string__object__width
                           (us_split_fields1 a))) (to_rep
                                                  (rec__fixed_string__object__width
                                                  (us_split_fields1 b))))
                        (= (bool_eq
                           (rec__fixed_string__object__name
                           (us_split_fields1 a)) 1 20
                           (rec__fixed_string__object__name
                           (us_split_fields1 b)) 1 20) true))
                   true false))

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

(declare-const fixed_string__object__width__first__bit Int)

(declare-const fixed_string__object__width__last__bit Int)

(declare-const fixed_string__object__width__position Int)

;; fixed_string__object__width__first__bit_axiom
  (assert (<= 0 fixed_string__object__width__first__bit))

;; fixed_string__object__width__last__bit_axiom
  (assert
  (< fixed_string__object__width__first__bit fixed_string__object__width__last__bit))

;; fixed_string__object__width__position_axiom
  (assert (<= 0 fixed_string__object__width__position))

(declare-const fixed_string__object__name__first__bit Int)

(declare-const fixed_string__object__name__last__bit Int)

(declare-const fixed_string__object__name__position Int)

;; fixed_string__object__name__first__bit_axiom
  (assert (<= 0 fixed_string__object__name__first__bit))

;; fixed_string__object__name__last__bit_axiom
  (assert
  (< fixed_string__object__name__first__bit fixed_string__object__name__last__bit))

;; fixed_string__object__name__position_axiom
  (assert (<= 0 fixed_string__object__name__position))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ((object__ref 0))
(((object__refqtmk (object__content us_rep)))))
(define-fun object__ref_object__content__projection ((a object__ref)) us_rep 
  (object__content a))

(declare-fun elements (us_rep) Int)

(declare-fun elements__function_guard (Int us_rep) Bool)

(declare-fun elements1 (Int us_rep) Int)

(declare-fun elements__function_guard1 (Int Int us_rep) Bool)

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-fun temp_____aggregate_def_166 (Int) (Array Int character))

(define-fun default_initial_assumption ((temp___expr_164 us_rep)
  (temp___skip_top_level_165 Bool)) Bool (and
                                         (= (attr__tag temp___expr_164) 
                                         us_tag)
                                         (and
                                         (= (to_rep
                                            (rec__fixed_string__object__width
                                            (us_split_fields1
                                            temp___expr_164))) 0)
                                         (= (rec__fixed_string__object__name
                                            (us_split_fields1
                                            temp___expr_164)) (temp_____aggregate_def_166
                                                              0)))))

;; elements__post_axiom
  (assert
  (forall ((this us_rep))
  (! (let ((result (elements this)))
     (=> (elements__function_guard result this) (dynamic_invariant result
     true false true true))) :pattern ((elements this)) )))

;; elements__post__dispatch_axiom
  (assert
  (forall ((attr__tag1 Int))
  (forall ((this us_rep))
  (! (let ((result (elements1 attr__tag1 this)))
     (=> (elements__function_guard1 result attr__tag1 this)
     (dynamic_invariant result true false true true))) :pattern ((elements1
                                                                 attr__tag1
                                                                 this)) ))))

;; fixed_string__object__compat_axiom
  (assert
  (forall ((this us_rep))
  (! (=> (elements__function_guard1 (elements1 us_tag this) us_tag this)
     (and
     (forall ((this1 us_rep)) (elements__function_guard (elements this1)
     this1)) (= (elements this) (elements1 us_tag this)))) :pattern (
  (elements1 us_tag this)) )))

;; elements__def_axiom
  (assert
  (forall ((this us_rep))
  (! (= (elements this) (to_rep
                        (rec__fixed_string__object__width
                        (us_split_fields1 this)))) :pattern ((elements this)) )))

(declare-const this us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const value__first integer)

(declare-const value__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((tvalueS__ref 0))
(((tvalueS__refqtmk (tvalueS__content us_t)))))
(define-fun tvalueS__ref_tvalueS__content__projection ((a tvalueS__ref)) us_t 
  (tvalueS__content a))

(declare-datatypes ((t15b__ref 0))
(((t15b__refqtmk (t15b__content us_t)))))
(define-fun t15b__ref_t15b__content__projection ((a t15b__ref)) us_t 
  (t15b__content a))

(declare-fun fixed_string__null_string__value__aggregate_def (Int Int
  Int) us_t)

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun dynamic_invariant2 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range3 temp___expr_74)))

(define-fun dynamic_invariant3 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(define-fun dynamic_invariant4 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

;; def_axiom
  (assert
  (forall ((temp___262 Int) (temp___263 Int) (temp___264 Int))
  (let ((temp___261 (fixed_string__null_string__value__aggregate_def
                    temp___262 temp___263 temp___264)))
  (=> (dynamic_invariant2 temp___262 true true true true)
  (and
  (=> (dynamic_property 1 2147483647 temp___263 temp___264)
  (and (= (first1 temp___261) temp___263) (= (last1 temp___261) temp___264)))
  (forall ((temp___265 Int))
  (= (to_rep1 (select (to_array temp___261) temp___265)) temp___262)))))))

;; def_axiom
  (assert
  (forall ((temp___168 Int))
  (=> (dynamic_invariant2 temp___168 true true true true)
  (forall ((temp___169 Int))
  (= (to_rep1 (select (temp_____aggregate_def_166 temp___168) temp___169)) temp___168)))))

(define-fun dynamic_invariant5 ((temp___expr_231 us_t)
  (temp___is_init_227 Bool) (temp___skip_constant_228 Bool)
  (temp___do_toplevel_229 Bool)
  (temp___do_typ_inv_230 Bool)) Bool (=>
                                     (not (= temp___skip_constant_228 true))
                                     (and (dynamic_property 1
                                     (to_rep
                                     (rec__fixed_string__object__width
                                     (us_split_fields1 this)))
                                     (first1 temp___expr_231)
                                     (last1 temp___expr_231))
                                     (and (= (first1 temp___expr_231) 1)
                                     (= (last1 temp___expr_231) (to_rep
                                                                (rec__fixed_string__object__width
                                                                (us_split_fields1
                                                                this))))))))

(define-fun default_initial_assumption1 ((temp___expr_233 us_t)
  (temp___skip_top_level_234 Bool)) Bool (and (= (first1 temp___expr_233) 1)
                                         (= (last1 temp___expr_233) (to_rep
                                                                    (rec__fixed_string__object__width
                                                                    (us_split_fields1
                                                                    this))))))

(assert
;; defqtvc
 ;; File "fixed_string.ads", line 24, characters 0-0
  (not
  (forall ((o Int))
  (=>
  (= (to_rep (rec__fixed_string__object__width (us_split_fields1 this))) o)
  (let ((temp___266 (fixed_string__null_string__value__aggregate_def 0 1 o)))
  (=> (= (first1 temp___266) 1)
  (=>
  (= (last1 temp___266) (to_rep
                        (rec__fixed_string__object__width
                        (us_split_fields1 this))))
  (=>
  (ite (<= (first1 temp___266) (last1 temp___266))
  (and
  (<= 1 (to_rep (rec__fixed_string__object__width (us_split_fields1 this))))
  (= (- (last1 temp___266) (first1 temp___266)) (- (to_rep
                                                   (rec__fixed_string__object__width
                                                   (us_split_fields1 this))) 1)))
  (< (to_rep (rec__fixed_string__object__width (us_split_fields1 this))) 1))
  (let ((fixed_string__null_string__value__assume (of_array
                                                  (to_array temp___266)
                                                  (first1 temp___266)
                                                  (last1 temp___266))))
  (forall ((value (Array Int character)))
  (=> (= value (to_array fixed_string__null_string__value__assume))
  (=>
  (= (to_rep2 value__first) (first1 fixed_string__null_string__value__assume))
  (=>
  (= (to_rep2 value__last) (last1 fixed_string__null_string__value__assume))
  (=>
  (and (dynamic_property 1
  (to_rep (rec__fixed_string__object__width (us_split_fields1 this)))
  (to_rep2 value__first) (to_rep2 value__last))
  (and (= (to_rep2 value__first) 1)
  (= (to_rep2 value__last) (to_rep
                           (rec__fixed_string__object__width
                           (us_split_fields1 this))))))
  (forall ((o1 Int))
  (=> (= (to_rep2 value__last) o1)
  (forall ((o2 Int))
  (=> (= (to_rep2 value__first) o2)
  (forall ((fixed_string__null_string__result us_t))
  (=> (= fixed_string__null_string__result (of_array value o2 o1))
  (=> (elements__function_guard (elements this) this)
  (= (length fixed_string__null_string__result) (elements this)))))))))))))))))))))))
(check-sat)
(exit)
