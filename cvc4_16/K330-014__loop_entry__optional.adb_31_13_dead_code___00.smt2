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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort character 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

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
  (forall ((x character)) (! (in_range4
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
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
  (forall ((x integer)) (! (in_range2 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep2 (first (mk f l))) f) (= (to_rep2 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

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

(declare-fun line_length (us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun line_length__function_guard (Int us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(declare-fun page_length (us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun page_length__function_guard (Int us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int natural))))))
(declare-fun slide1 ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first2 Int))
  (! (= (slide1 a first2 first2) a) :pattern ((slide1 a first2 first2)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_156 Int))
                           (=>
                           (and (<= a__first temp___idx_156)
                           (<= temp___idx_156 a__last))
                           (= (to_rep (select a temp___idx_156)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_156)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int natural)) (b (Array Int natural)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_156 Int))
  (=> (and (<= a__first temp___idx_156) (<= temp___idx_156 a__last))
  (= (to_rep (select a temp___idx_156)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_156)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort map1 0)

(declare-datatypes ((map__ref2 0))
(((map__refqtmk2 (map__content2 map1)))))
(declare-fun get (map1 Int Int) natural)

(declare-fun set (map1 Int Int natural) map1)

;; Select_eq
  (assert
  (forall ((m map1))
  (forall ((i Int))
  (forall ((j Int))
  (forall ((a natural))
  (! (= (get (set m i j a) i j) a) :pattern ((set m i j a)) ))))))

;; Select_neq
  (assert
  (forall ((m map1))
  (forall ((i Int) (i2 Int))
  (forall ((j Int) (j2 Int))
  (forall ((a natural))
  (! (=> (not (and (= i i2) (= j j2)))
     (= (get (set m i j a) i2 j2) (get m i2 j2))) :pattern ((get
                                                            (set m i j a) i2
                                                            j2)) :pattern (
  (set m i j a) (get m i2 j2)) ))))))

(declare-fun slide2 (map1 Int Int Int Int) map1)

;; slide_def
  (assert
  (forall ((a map1))
  (forall ((new_first Int) (old_first Int))
  (forall ((new_first_2 Int) (old_first_2 Int))
  (forall ((i Int))
  (forall ((j Int))
  (! (= (get (slide2 a old_first new_first old_first_2 new_first_2) i j) 
  (get a (- i (- new_first old_first)) (- j (- new_first_2 old_first_2)))) :pattern (
  (get (slide2 a old_first new_first old_first_2 new_first_2) i j)) )))))))

(define-fun bool_eq3 ((a map1) (a__first Int) (a__last Int) (a__first_2 Int)
  (a__last_2 Int) (b map1) (b__first Int) (b__last Int) (b__first_2 Int)
  (b__last_2 Int)) Bool (ite (and
                             (and
                             (ite (<= a__first a__last)
                             (and (<= b__first b__last)
                             (= (- a__last a__first) (- b__last b__first)))
                             (< b__last b__first))
                             (ite (<= a__first_2 a__last_2)
                             (and (<= b__first_2 b__last_2)
                             (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
                             (< b__last_2 b__first_2)))
                             (forall ((temp___idx_157 Int)
                             (temp___idx_158 Int))
                             (=>
                             (and
                             (and (<= a__first temp___idx_157)
                             (<= temp___idx_157 a__last))
                             (and (<= a__first_2 temp___idx_158)
                             (<= temp___idx_158 a__last_2)))
                             (= (to_rep
                                (get a temp___idx_157 temp___idx_158)) 
                             (to_rep
                             (get b (+ (- b__first a__first) temp___idx_157)
                             (+ (- b__first_2 a__first_2) temp___idx_158)))))))
                        true false))

;; bool_eq_rev
  (assert
  (forall ((a map1) (b map1))
  (forall ((a__first Int) (a__last Int) (a__first_2 Int) (a__last_2 Int)
  (b__first Int) (b__last Int) (b__first_2 Int) (b__last_2 Int))
  (=>
  (= (bool_eq3 b b__first b__last b__first_2 b__last_2 a a__first a__last
     a__first_2 a__last_2) true)
  (and
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (ite (<= a__first_2 a__last_2)
  (and (<= b__first_2 b__last_2)
  (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
  (< b__last_2 b__first_2)))
  (forall ((temp___idx_157 Int) (temp___idx_158 Int))
  (=>
  (and (and (<= a__first temp___idx_157) (<= temp___idx_157 a__last))
  (and (<= a__first_2 temp___idx_158) (<= temp___idx_158 a__last_2)))
  (= (to_rep (get a temp___idx_157 temp___idx_158)) (to_rep
                                                    (get b
                                                    (+ (- b__first a__first) temp___idx_157)
                                                    (+ (- b__first_2 a__first_2) temp___idx_158)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-fun sum_of (Int) Int)

(declare-fun sum_of__function_guard (Int Int) Bool)

;; sum_of__post_axiom
  (assert
  (forall ((val__ Int)) (! (in_range1
  (sum_of val__)) :pattern ((sum_of val__)) )))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort tTtaSP1 0)

(declare-fun tTtaSP1qtint (tTtaSP1) Int)

;; tTtaSP1'axiom
  (assert
  (forall ((i tTtaSP1))
  (and (<= 1 (tTtaSP1qtint i)) (<= (tTtaSP1qtint i) 5))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (tTtaSP1 tTtaSP1) Bool)

(declare-const dummy5 tTtaSP1)

(declare-datatypes ((tTtaSP1__ref 0))
(((tTtaSP1__refqtmk (tTtaSP1__content tTtaSP1)))))
(define-fun tTtaSP1__ref_tTtaSP1__content__projection ((a tTtaSP1__ref)) tTtaSP1 
  (tTtaSP1__content a))

(declare-sort t6b 0)

(declare-fun t6bqtint (t6b) Int)

;; t6b'axiom
  (assert (forall ((i t6b)) (and (<= 1 (t6bqtint i)) (<= (t6bqtint i) 5))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (t6b t6b) Bool)

(declare-const dummy6 t6b)

(declare-datatypes ((t6b__ref 0))
(((t6b__refqtmk (t6b__content t6b)))))
(define-fun t6b__ref_t6b__content__projection ((a t6b__ref)) t6b (t6b__content
                                                                 a))

(declare-sort tTtaSP11 0)

(declare-fun tTtaSP1qtint1 (tTtaSP11) Int)

;; tTtaSP1'axiom
  (assert
  (forall ((i tTtaSP11))
  (and (<= 1 (tTtaSP1qtint1 i)) (<= (tTtaSP1qtint1 i) 3))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq7 (tTtaSP11 tTtaSP11) Bool)

(declare-const dummy7 tTtaSP11)

(declare-datatypes ((tTtaSP1__ref1 0))
(((tTtaSP1__refqtmk1 (tTtaSP1__content1 tTtaSP11)))))
(define-fun tTtaSP1__ref_tTtaSP1__content__2__projection ((a tTtaSP1__ref1)) tTtaSP11 
  (tTtaSP1__content1 a))

(declare-sort t11b 0)

(declare-fun t11bqtint (t11b) Int)

;; t11b'axiom
  (assert
  (forall ((i t11b)) (and (<= 1 (t11bqtint i)) (<= (t11bqtint i) 2))))

(define-fun in_range8 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq8 (t11b t11b) Bool)

(declare-const dummy8 t11b)

(declare-datatypes ((t11b__ref 0))
(((t11b__refqtmk (t11b__content t11b)))))
(define-fun t11b__ref_t11b__content__projection ((a t11b__ref)) t11b 
  (t11b__content a))

(declare-fun temp___String_Literal_224 (tuple0) (Array Int character))

;; temp___String_Literal_224__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep1 (select (temp___String_Literal_224 us_void_param) 1)) 79)
     (= (to_rep1 (select (temp___String_Literal_224 us_void_param) 2)) 112))
     (and
     (and
     (and
     (= (to_rep1 (select (temp___String_Literal_224 us_void_param) 3)) 116)
     (= (to_rep1 (select (temp___String_Literal_224 us_void_param) 4)) 105))
     (= (to_rep1 (select (temp___String_Literal_224 us_void_param) 5)) 111))
     (and
     (and
     (= (to_rep1 (select (temp___String_Literal_224 us_void_param) 6)) 110)
     (= (to_rep1 (select (temp___String_Literal_224 us_void_param) 7)) 97))
     (= (to_rep1 (select (temp___String_Literal_224 us_void_param) 8)) 108)))) :pattern (
  (temp___String_Literal_224 us_void_param)) )))

(declare-fun optional__B_1__ta__aggregate_def (Int) (Array Int natural))

(declare-fun temp___String_Literal_243 (tuple0) (Array Int character))

;; temp___String_Literal_243__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 1)) 69)
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 2)) 82))
     (and
     (and
     (and
     (and
     (and
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 3)) 82)
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 4)) 79))
     (and
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 5)) 82)
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 6)) 32)))
     (and
     (and
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 7)) 50)
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 8)) 58))
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 9)) 32)))
     (and
     (and
     (and
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 10)) 115)
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 11)) 104))
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 12)) 111))
     (and
     (and
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 13)) 117)
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 14)) 108))
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 15)) 100))))
     (and
     (and
     (and
     (and
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 16)) 32)
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 17)) 110))
     (and
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 18)) 111)
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 19)) 116)))
     (and
     (and
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 20)) 32)
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 21)) 103))
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 22)) 101)))
     (and
     (and
     (and
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 23)) 116)
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 24)) 32))
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 25)) 104))
     (and
     (and
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 26)) 101)
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 27)) 114))
     (= (to_rep1 (select (temp___String_Literal_243 us_void_param) 28)) 101)))))) :pattern (
  (temp___String_Literal_243 us_void_param)) )))

(declare-fun optional__B_3__ta__aggregate_def (Int) map1)

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant2 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range4 temp___expr_74)))

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
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___233 Int))
  (=> (dynamic_invariant temp___233 true true true true)
  (forall ((temp___234 Int))
  (= (select (optional__B_1__ta__aggregate_def temp___233) temp___234) 
  rliteral)))))

;; def_axiom
  (assert
  (forall ((temp___245 Int))
  (=> (dynamic_invariant temp___245 true true true true)
  (forall ((temp___246 Int) (temp___247 Int))
  (= (get (optional__B_3__ta__aggregate_def temp___245) temp___246
     temp___247) rliteral)))))

(declare-sort count 0)

(declare-fun countqtint (count) Int)

;; count'axiom
  (assert
  (forall ((i count))
  (and (<= 0 (countqtint i)) (<= (countqtint i) 2147483647))))

(define-fun in_range9 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE9 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check9 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE9 (us_image) Int)

(declare-fun user_eq9 (count count) Bool)

(declare-const dummy9 count)

(declare-datatypes ((count__ref 0))
(((count__refqtmk (count__content count)))))
(define-fun count__ref_count__content__projection ((a count__ref)) count 
  (count__content a))

(define-fun dynamic_invariant5 ((temp___expr_164 Int)
  (temp___is_init_160 Bool) (temp___skip_constant_161 Bool)
  (temp___do_toplevel_162 Bool)
  (temp___do_typ_inv_163 Bool)) Bool (=>
                                     (or (= temp___is_init_160 true)
                                     (<= 0 2147483647)) (in_range9
                                     temp___expr_164)))

;; line_length__post_axiom
  (assert
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__file_system us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private)
  (ada___ada__text_io__current_err us_private)) (! (dynamic_invariant5
  (line_length ada___ada__text_io__standard_in
  ada___ada__text_io__file_system ada___ada__text_io__standard_out
  ada___ada__text_io__standard_err ada___ada__text_io__current_in
  ada___ada__text_io__current_out ada___ada__text_io__current_err) true false
  true
  true) :pattern ((line_length ada___ada__text_io__standard_in
                  ada___ada__text_io__file_system
                  ada___ada__text_io__standard_out
                  ada___ada__text_io__standard_err
                  ada___ada__text_io__current_in
                  ada___ada__text_io__current_out
                  ada___ada__text_io__current_err)) )))

;; page_length__post_axiom
  (assert
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__file_system us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private)
  (ada___ada__text_io__current_err us_private)) (! (dynamic_invariant5
  (page_length ada___ada__text_io__standard_in
  ada___ada__text_io__file_system ada___ada__text_io__standard_out
  ada___ada__text_io__standard_err ada___ada__text_io__current_in
  ada___ada__text_io__current_out ada___ada__text_io__current_err) true false
  true
  true) :pattern ((page_length ada___ada__text_io__standard_in
                  ada___ada__text_io__file_system
                  ada___ada__text_io__standard_out
                  ada___ada__text_io__standard_err
                  ada___ada__text_io__current_in
                  ada___ada__text_io__current_out
                  ada___ada__text_io__current_err)) )))

(declare-const rliteral1 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral1) 1))

(assert
;; defqtvc
 ;; File "optional.adb", line 5, characters 0-0
  (not
  (forall ((standard_in us_private) (file_system us_private)
  (standard_out us_private) (standard_err us_private) (current_in us_private)
  (current_out us_private) (current_err us_private) (standard_in1 us_private)
  (file_system1 us_private) (standard_out1 us_private)
  (standard_err1 us_private) (current_in1 us_private)
  (current_out1 us_private) (current_err1 us_private) (ta map1))
  (=>
  (= (line_length standard_in file_system standard_out standard_err
     current_in current_out current_err) (line_length standard_in1
                                         file_system1 standard_out1
                                         standard_err1 current_in1
                                         current_out1 current_err1))
  (=>
  (= (page_length standard_in file_system standard_out standard_err
     current_in current_out current_err) (page_length standard_in1
                                         file_system1 standard_out1
                                         standard_err1 current_in1
                                         current_out1 current_err1))
  (=>
  (exists ((ta1 (Array Int natural)))
  (and (= ta1 (optional__B_1__ta__aggregate_def 0))
  (exists ((index Int))
  (and (= index 1)
  (or
  (not
  (= (and (ite (<= 1 index) true false) (ite (<= index 5) true false)) true))
  (exists ((temp___loop_entry_231 (Array Int natural)))
  (and (= temp___loop_entry_231 ta1)
  (exists ((o Int))
  (and (= (to_rep (select temp___loop_entry_231 index)) o)
  (exists ((ta2 (Array Int natural)) (index1 Int))
  (and (= (to_rep (select temp___loop_entry_231 index1)) 0)
  (and
  (= (and (ite (and (in_range6 index1)
               (forall ((temp___229 Int))
               (=> (and (<= 1 temp___229) (<= temp___229 5))
               (=>
               (or (< 5 temp___229)
               (or (< temp___229 1) (<= index1 temp___229)))
               (= (select ta2 temp___229) (select ta1 temp___229))))))
          true false) (ite (and (<= 1 index1) (<= index1 5)) true false)) true)
  (= index1 5)))))))))))))
  (=> (= ta (optional__B_3__ta__aggregate_def 0))
  (let ((temp___235 (sum_of 2)))
  (=>
  (and (sum_of__function_guard temp___235 2) (dynamic_invariant temp___235
  true false true true))
  (=> (and (<= 1 temp___235) (<= temp___235 3))
  (forall ((ta1 map1))
  (=> (= ta1 (set ta temp___235 2 rliteral1))
  (forall ((outer Int))
  (=> (= outer 1)
  (forall ((inner Int))
  (=> (= inner 1)
  (not
  (= (and (ite (<= 1 inner) true false) (ite (<= inner 2) true false)) true))))))))))))))))))
(check-sat)
(exit)
