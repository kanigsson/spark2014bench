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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-sort character 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (character character) Bool)

(declare-const dummy2 character)

(declare-datatypes ()
((character__ref (character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range3 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int character))))))
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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (positive positive) Bool)

(declare-const dummy3 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range4 low) (in_range4 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ()
((string____ref (string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(declare-const no_vote_entry (Array Int character))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const program_phase Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

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

(declare-datatypes ()
((map__ref1
 (map__refqtmk1 (map__content1 (Array Int (Array Int character)))))))
(declare-fun slide1 ((Array Int (Array Int character)) Int
  Int) (Array Int (Array Int character)))

;; slide_eq
  (assert
  (forall ((a (Array Int (Array Int character))))
  (forall ((first2 Int))
  (! (= (slide1 a first2 first2) a) :pattern ((slide1 a first2 first2)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int (Array Int character))))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int (Array Int character))) (a__first Int)
  (a__last Int) (b (Array Int (Array Int character))) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (bool_eq (select a temp___idx_155) 1 70
                              (select b (+ (- b__first a__first) temp___idx_155))
                              1 70) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int (Array Int character)))
  (b (Array Int (Array Int character))))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (bool_eq (select a temp___idx_155) 1 70
     (select b (+ (- b__first a__first) temp___idx_155)) 1 70) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const candidates_filename (Array Int character))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-sort us_rep 0)

(declare-fun bool_eq3 (us_rep us_rep) Bool)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ()
((file_type__ref (file_type__refqtmk (file_type__content us_rep)))))
(define-fun file_type__ref_file_type__content__projection ((a file_type__ref)) us_rep 
  (file_type__content a))

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-fun is_open (us_rep) Bool)

(declare-fun is_open__function_guard (Bool us_rep) Bool)

(declare-fun mode (us_rep) Int)

(declare-fun mode__function_guard (Int us_rep) Bool)

(declare-fun line_length (us_rep us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun line_length__function_guard (Int us_rep us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(declare-fun page_length (us_rep us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun page_length__function_guard (Int us_rep us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(define-fun default_initial_assumption ((temp___expr_292 us_rep)
  (temp___skip_top_level_293 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_293 true))
                                         (not
                                         (= (is_open temp___expr_292) true))))

(declare-fun end_of_file (us_rep us_private us_private us_private us_private
  us_private us_private us_private) Bool)

(declare-fun end_of_file__function_guard (Bool us_rep us_private us_private
  us_private us_private us_private us_private us_private) Bool)

;; end_of_file__post_axiom
  (assert true)

(define-fun length1 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(declare-const r17b Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const r20b Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-sort tcandidate_name_tP1 0)

(declare-fun tcandidate_name_tP1qtint (tcandidate_name_tP1) Int)

;; tcandidate_name_tP1'axiom
  (assert
  (forall ((i tcandidate_name_tP1))
  (and (<= 1 (tcandidate_name_tP1qtint i))
  (<= (tcandidate_name_tP1qtint i) 70))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 70)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq7 (tcandidate_name_tP1 tcandidate_name_tP1) Bool)

(declare-const dummy7 tcandidate_name_tP1)

(declare-datatypes ()
((tcandidate_name_tP1__ref
 (tcandidate_name_tP1__refqtmk
 (tcandidate_name_tP1__content tcandidate_name_tP1)))))
(define-fun tcandidate_name_tP1__ref_tcandidate_name_tP1__content__projection ((a tcandidate_name_tP1__ref)) tcandidate_name_tP1 
  (tcandidate_name_tP1__content a))

(declare-fun temp___String_Literal_154 (tuple0) (Array Int character))

;; temp___String_Literal_154__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_154 us_void_param) 1)) 78)
     (= (to_rep (select (temp___String_Literal_154 us_void_param) 2)) 111))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_154 us_void_param) 3)) 32)
     (= (to_rep (select (temp___String_Literal_154 us_void_param) 4)) 118))
     (= (to_rep (select (temp___String_Literal_154 us_void_param) 5)) 111))
     (and
     (= (to_rep (select (temp___String_Literal_154 us_void_param) 6)) 116)
     (= (to_rep (select (temp___String_Literal_154 us_void_param) 7)) 101)))) :pattern (
  (temp___String_Literal_154 us_void_param)) )))

(declare-sort program_phase_t 0)

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq8 (program_phase_t program_phase_t) Bool)

(declare-const dummy8 program_phase_t)

(declare-datatypes ()
((program_phase_t__ref
 (program_phase_t__refqtmk (program_phase_t__content program_phase_t)))))
(define-fun program_phase_t__ref_program_phase_t__content__projection ((a program_phase_t__ref)) program_phase_t 
  (program_phase_t__content a))

(define-fun dynamic_invariant1 ((temp___expr_191 Int)
  (temp___is_init_187 Bool) (temp___skip_constant_188 Bool)
  (temp___do_toplevel_189 Bool)
  (temp___do_typ_inv_190 Bool)) Bool (=>
                                     (or (= temp___is_init_187 true)
                                     (<= 0 2)) (in_range6 temp___expr_191)))

(declare-sort candidate_number_t 0)

(declare-fun candidate_number_tqtint (candidate_number_t) Int)

;; candidate_number_t'axiom
  (assert
  (forall ((i candidate_number_t))
  (and (<= 0 (candidate_number_tqtint i))
  (<= (candidate_number_tqtint i) 20))))

(define-fun in_range7 ((x Int)) Bool (and (<= 0 x) (<= x 20)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq9 (candidate_number_t candidate_number_t) Bool)

(declare-const dummy9 candidate_number_t)

(declare-datatypes ()
((candidate_number_t__ref
 (candidate_number_t__refqtmk
 (candidate_number_t__content candidate_number_t)))))
(define-fun candidate_number_t__ref_candidate_number_t__content__projection ((a candidate_number_t__ref)) candidate_number_t 
  (candidate_number_t__content a))

(define-fun dynamic_invariant2 ((temp___expr_205 Int)
  (temp___is_init_201 Bool) (temp___skip_constant_202 Bool)
  (temp___do_toplevel_203 Bool)
  (temp___do_typ_inv_204 Bool)) Bool (=>
                                     (or (= temp___is_init_201 true)
                                     (<= 0 20)) (in_range7 temp___expr_205)))

(declare-sort tTcandidates_filenameSP1 0)

(declare-fun tTcandidates_filenameSP1qtint (tTcandidates_filenameSP1) Int)

;; tTcandidates_filenameSP1'axiom
  (assert
  (forall ((i tTcandidates_filenameSP1))
  (and (<= 1 (tTcandidates_filenameSP1qtint i))
  (<= (tTcandidates_filenameSP1qtint i) 14))))

(define-fun in_range8 ((x Int)) Bool (and (<= 1 x) (<= x 14)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq10 (tTcandidates_filenameSP1
  tTcandidates_filenameSP1) Bool)

(declare-const dummy10 tTcandidates_filenameSP1)

(declare-datatypes ()
((tTcandidates_filenameSP1__ref
 (tTcandidates_filenameSP1__refqtmk
 (tTcandidates_filenameSP1__content tTcandidates_filenameSP1)))))
(define-fun tTcandidates_filenameSP1__ref_tTcandidates_filenameSP1__content__projection ((a tTcandidates_filenameSP1__ref)) tTcandidates_filenameSP1 
  (tTcandidates_filenameSP1__content a))

(declare-fun temp___String_Literal_161 (tuple0) (Array Int character))

;; temp___String_Literal_161__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_161 us_void_param) 1)) 99)
     (= (to_rep (select (temp___String_Literal_161 us_void_param) 2)) 97))
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_161 us_void_param) 3)) 110)
     (= (to_rep (select (temp___String_Literal_161 us_void_param) 4)) 100))
     (= (to_rep (select (temp___String_Literal_161 us_void_param) 5)) 105))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_161 us_void_param) 6)) 100)
     (= (to_rep (select (temp___String_Literal_161 us_void_param) 7)) 97))
     (= (to_rep (select (temp___String_Literal_161 us_void_param) 8)) 116)))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_161 us_void_param) 9)) 101)
     (= (to_rep (select (temp___String_Literal_161 us_void_param) 10)) 115))
     (= (to_rep (select (temp___String_Literal_161 us_void_param) 11)) 46))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_161 us_void_param) 12)) 116)
     (= (to_rep (select (temp___String_Literal_161 us_void_param) 13)) 120))
     (= (to_rep (select (temp___String_Literal_161 us_void_param) 14)) 116))))) :pattern (
  (temp___String_Literal_161 us_void_param)) )))

(declare-datatypes () ((t19b__ref (t19b__refqtmk (t19b__content us_t)))))
(define-fun t19b__ref_t19b__content__projection ((a t19b__ref)) us_t 
  (t19b__content a))

(declare-datatypes () ((t22b__ref (t22b__refqtmk (t22b__content us_t)))))
(define-fun t22b__ref_t22b__content__projection ((a t22b__ref)) us_t 
  (t22b__content a))

(declare-fun temp_____aggregate_def_321 ((Array Int character)) (Array Int (Array Int character)))

(declare-fun temp_____aggregate_def_325 (Int) (Array Int character))

(declare-fun temp___String_Literal_332 (tuple0) (Array Int character))

;; temp___String_Literal_332__def_axiom
  (assert true)

(define-fun dynamic_invariant3 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range4
                                    temp___expr_46)))

(define-fun dynamic_invariant4 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range3 temp___expr_74)))

(define-fun dynamic_invariant5 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(define-fun dynamic_invariant6 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

;; candidates_filename__def_axiom
  (assert (= candidates_filename (temp___String_Literal_161 Tuple0)))

;; def_axiom
  (assert
  (forall ((temp___323 (Array Int character)))
  (forall ((temp___324 Int))
  (= (select (temp_____aggregate_def_321 temp___323) temp___324) temp___323))))

;; def_axiom
  (assert
  (forall ((temp___327 Int))
  (=> (dynamic_invariant4 temp___327 true true true true)
  (forall ((temp___328 Int))
  (= (to_rep (select (temp_____aggregate_def_325 temp___327) temp___328)) temp___327)))))

;; no_vote_entry__def_axiom
  (assert (= no_vote_entry (temp___String_Literal_154 Tuple0)))

(declare-sort file_mode 0)

(define-fun pos_to_rep ((x Int)) Int (ite (= x 2) 3 (ite (= x 1) 2 0)))

(define-fun in_range9 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE9 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check9 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE9 (us_image) Int)

(declare-fun user_eq11 (file_mode file_mode) Bool)

(declare-const dummy11 file_mode)

(declare-datatypes ()
((file_mode__ref (file_mode__refqtmk (file_mode__content file_mode)))))
(define-fun file_mode__ref_file_mode__content__projection ((a file_mode__ref)) file_mode 
  (file_mode__content a))

(define-fun dynamic_invariant7 ((temp___expr_299 Int)
  (temp___is_init_295 Bool) (temp___skip_constant_296 Bool)
  (temp___do_toplevel_297 Bool)
  (temp___do_typ_inv_298 Bool)) Bool (=>
                                     (or (= temp___is_init_295 true)
                                     (<= 0 2)) (in_range9 temp___expr_299)))

(declare-sort count 0)

(declare-fun countqtint (count) Int)

;; count'axiom
  (assert
  (forall ((i count))
  (and (<= 0 (countqtint i)) (<= (countqtint i) 2147483647))))

(define-fun in_range10 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE10 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check10 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE10 (us_image) Int)

(declare-fun user_eq12 (count count) Bool)

(declare-const dummy12 count)

(declare-datatypes () ((count__ref (count__refqtmk (count__content count)))))
(define-fun count__ref_count__content__projection ((a count__ref)) count 
  (count__content a))

(define-fun dynamic_invariant8 ((temp___expr_274 Int)
  (temp___is_init_270 Bool) (temp___skip_constant_271 Bool)
  (temp___do_toplevel_272 Bool)
  (temp___do_typ_inv_273 Bool)) Bool (=>
                                     (or (= temp___is_init_270 true)
                                     (<= 0 2147483647)) (in_range10
                                     temp___expr_274)))

;; mode__post_axiom
  (assert
  (forall ((file us_rep))
  (! (=> (= (is_open file) true) (dynamic_invariant7 (mode file) true false
     true true)) :pattern ((mode file)) )))

;; is_open__post_axiom
  (assert true)

;; line_length__post_axiom
  (assert
  (forall ((file us_rep))
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__file_system us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private)
  (ada___ada__text_io__current_err us_private))
  (! (=> (and (= (is_open file) true) (not (= (mode file) 0)))
     (dynamic_invariant8
     (line_length file ada___ada__text_io__standard_in
     ada___ada__text_io__file_system ada___ada__text_io__standard_out
     ada___ada__text_io__standard_err ada___ada__text_io__current_in
     ada___ada__text_io__current_out ada___ada__text_io__current_err) true
     false true true)) :pattern ((line_length file
                                 ada___ada__text_io__standard_in
                                 ada___ada__text_io__file_system
                                 ada___ada__text_io__standard_out
                                 ada___ada__text_io__standard_err
                                 ada___ada__text_io__current_in
                                 ada___ada__text_io__current_out
                                 ada___ada__text_io__current_err)) ))))

;; page_length__post_axiom
  (assert
  (forall ((file us_rep))
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__file_system us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private)
  (ada___ada__text_io__current_err us_private))
  (! (=> (and (= (is_open file) true) (not (= (mode file) 0)))
     (dynamic_invariant8
     (page_length file ada___ada__text_io__standard_in
     ada___ada__text_io__file_system ada___ada__text_io__standard_out
     ada___ada__text_io__standard_err ada___ada__text_io__current_in
     ada___ada__text_io__current_out ada___ada__text_io__current_err) true
     false true true)) :pattern ((page_length file
                                 ada___ada__text_io__standard_in
                                 ada___ada__text_io__file_system
                                 ada___ada__text_io__standard_out
                                 ada___ada__text_io__standard_err
                                 ada___ada__text_io__current_in
                                 ada___ada__text_io__current_out
                                 ada___ada__text_io__current_err)) ))))

(declare-const candidates (Array Int (Array Int character)))

(declare-const last_candidate Int)

(declare-const file us_rep)

(declare-const last2 Int)

(declare-const item (Array Int character))

;; Assume
  (assert true)

;; Assume
  (assert (= (temp___String_Literal_161 Tuple0) candidates_filename))

;; Assume
  (assert true)

;; Assume
  (assert (= (temp___String_Literal_154 Tuple0) no_vote_entry))

;; Assume
  (assert (dynamic_invariant1 program_phase true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant2 last_candidate false false true true))

;; Assume
  (assert (= program_phase 0))

;; Assume
  (assert (default_initial_assumption file false))

;; Assume
  (assert true)

(declare-const current_candidate Int)

;; H
  (assert (= current_candidate 0))

;; Assume
  (assert (dynamic_invariant2 current_candidate true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant last2 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert true)

(declare-const candidates1 (Array Int (Array Int character)))

;; H
  (assert
  (= candidates1 (temp_____aggregate_def_321 (temp_____aggregate_def_325 32))))

(declare-const usf (Array Int character))

;; H
  (assert true)

;; H
  (assert true)

;; H
  (assert true)

;; H
  (assert
  (forall ((temp___331 Int))
  (ite (and (<= 1 temp___331) (<= temp___331 7))
  (= (select usf temp___331) (select no_vote_entry temp___331))
  (= (select usf temp___331) (select (select candidates1 0) temp___331)))))

(declare-const candidates2 (Array Int (Array Int character)))

;; H
  (assert (= candidates2 (store candidates1 0 usf)))

(declare-const file1 us_rep)

(declare-const standard_in us_private)

(declare-const file_system us_private)

(declare-const standard_out us_private)

(declare-const standard_err us_private)

(declare-const current_in us_private)

(declare-const current_out us_private)

(declare-const current_err us_private)

;; H
  (assert (= (is_open file1) true))

;; H
  (assert (= (mode file1) 0))

;; H
  (assert true)

;; H
  (assert true)

(assert
;; defqtvc
 ;; File "evoting.ads", line 51, characters 0-0
  (not (= (is_open file1) true)))
(check-sat)
